#include "mlir/Dialect/Arith/IR/Arith.h"
#include "mlir/Dialect/Func/IR/FuncOps.h"
#include "mlir/Dialect/Linalg/IR/Linalg.h"
#include "mlir/Dialect/Utils/IndexingUtils.h"
#include "mlir/IR/BuiltinAttributes.h"
#include "mlir/IR/DialectResourceBlobManager.h"
#include "mlir/IR/Matchers.h"
#include "mlir/Pass/Pass.h"
#include "mlir/Transforms/GreedyPatternRewriteDriver.h"
#include "llvm/ADT/SmallVector.h"
#include <type_traits> // For std::decay_t

namespace toynpu {

#define GEN_PASS_DEF_TRANSPOSEFOLDERPASS
#include "ToyNPU/Passes.h.inc"

namespace {

template <typename RangeType>
mlir::DenseResourceElementsAttr
transposeType(const RangeType &data, mlir::ShapedType inputType,
              mlir::ShapedType outputType, llvm::ArrayRef<int64_t> permValues,
              llvm::StringRef newBlobName) {
  using ElementType = std::decay_t<decltype(*std::begin(data))>;

  assert(inputType.getElementType() == outputType.getElementType());

  auto inputShape = inputType.getShape();

  // The inverted permutation map and strides of the output are used to compute
  // the contribution of a given dimension to the destination linear index in
  // an order-independent way.
  auto outputStrides = mlir::computeStrides(outputType.getShape());
  auto invertedPermValues = mlir::invertPermutationVector(permValues);

  auto initialValue = *std::begin(data);
  llvm::SmallVector<ElementType> outputValues(inputType.getNumElements(),
                                              initialValue);

  for (const auto &it : llvm::enumerate(data)) {
    auto srcLinearIndex = it.index();

    uint64_t dstLinearIndex = 0;
    for (int64_t dim = inputShape.size() - 1; dim >= 0; --dim) {
      // Compute the index into the current dimension of the source vector.
      auto sourceIndexForDim = srcLinearIndex % inputShape[dim];
      srcLinearIndex /= inputShape[dim];

      // Add the contribution of the current dimension to the output using the
      // permutation map.
      dstLinearIndex +=
          outputStrides[invertedPermValues[dim]] * sourceIndexForDim;
    }

    outputValues[dstLinearIndex] = it.value();
  }

  mlir::MLIRContext *ctx = outputType.getContext();
  auto resourceManager =
      mlir::DenseResourceElementsHandle::getManagerInterface(ctx);

  auto blob = mlir::UnmanagedAsmResourceBlob::allocateInferAlign(
      llvm::ArrayRef(outputValues));
  return mlir::DenseResourceElementsAttr::get(outputType, newBlobName,
                                              std::move(blob));
}

struct LinalgFoldConstantTranspose
    : public mlir::OpRewritePattern<mlir::linalg::TransposeOp> {
  using OpRewritePattern<mlir::linalg::TransposeOp>::OpRewritePattern;

  mlir::LogicalResult
  matchAndRewrite(mlir::linalg::TransposeOp op,
                  mlir::PatternRewriter &rewriter) const final {

    auto outputType = mlir::cast<mlir::ShapedType>(op.getType(0));

    if (!outputType.getElementType().isF32())
      return mlir::failure();

    // Get input type
    auto inputType = mlir::cast<mlir::ShapedType>(op.getInput().getType());

    if (inputType.getNumElements() == 0)
      return mlir::failure();

    // Match input as a constant
    mlir::ElementsAttr inputValues;
    if (!matchPattern(op.getInput(), m_Constant(&inputValues)))
      return mlir::failure();

    if (!mlir::isa<mlir::DenseResourceElementsAttr>(inputValues))
      return mlir::failure();

    // Make sure the constant input has only this transpose op as a user.
    // This avoids potentially duplicating large constants if the constant is
    // used elsewhere.
    if (!llvm::hasSingleElement(op.getInput().getDefiningOp()->getUsers()))
      return mlir::failure();

    // Get permutation map
    auto permutations = op.getPermutation();

    auto denseResource =
        mlir::dyn_cast<mlir::DenseResourceElementsAttr>(inputValues);
    // Check that the resource memory blob exists
    auto handle = denseResource.getRawHandle();
    mlir::AsmResourceBlob *blob = handle.getBlob();
    if (!blob)
      return mlir::failure();

    // Check that the data are in a valid form
    bool isSplat = false;
    if (!mlir::DenseElementsAttr::isValidRawBuffer(inputType, blob->getData(),
                                                   isSplat))
      return mlir::failure();

    auto data = blob->getDataAs<float>();
    auto newBlobName = handle.getKey() + "_transposed";

    // Perform the transpose on the constant data
    auto resultAttr = transposeType(data, inputType, outputType, permutations,
                                    newBlobName.str());

    // Replace the linalg.transpose op with the new constant
    rewriter.replaceOpWithNewOp<mlir::arith::ConstantOp>(op, outputType,
                                                         resultAttr);
    return mlir::success();
  }
};

struct TransposeFolderPass
    : impl::TransposeFolderPassBase<TransposeFolderPass> {
  void runOnOperation() override {
    mlir::RewritePatternSet patterns(&getContext());
    patterns.add<toynpu::LinalgFoldConstantTranspose>(&getContext());

    if (failed(mlir::applyPatternsAndFoldGreedily(getOperation(),
                                                  std::move(patterns)))) {
      signalPassFailure();
    }
  }
};

} // namespace
} // namespace toynpu
