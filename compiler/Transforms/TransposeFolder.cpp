#include "TransposeFolder.h"

#include "mlir/Dialect/Arith/IR/Arith.h"
#include "mlir/Dialect/Utils/IndexingUtils.h"
#include "mlir/IR/Attributes.h"
#include "mlir/IR/BuiltinAttributes.h"
#include "mlir/IR/BuiltinTypes.h"
#include "mlir/IR/DialectResourceBlobManager.h"
#include "mlir/IR/Matchers.h"
#include "mlir/IR/Types.h"
#include "llvm/ADT/APFloat.h"
#include "llvm/ADT/FloatingPointMode.h"
#include "llvm/ADT/SmallVector.h"
#include <optional>
#include <type_traits> // For std::decay_t

namespace nn_compiler {

// --- Implementation copied from original TransposeFolder.cpp --- 
template <typename T>
std::optional<llvm::ArrayRef<T>>
tryGetDenseResourceValues(mlir::ElementsAttr attr) {
  if (auto denseResource =
          mlir::dyn_cast<mlir::DenseResourceElementsAttr>(attr)) {
    // Check that the resource memory blob exists
    mlir::AsmResourceBlob *blob = denseResource.getRawHandle().getBlob();
    if (!blob)
      return std::nullopt;

    // Check that the data are in a valid form
    bool isSplat = false;
    if (!mlir::DenseElementsAttr::isValidRawBuffer(attr.getShapedType(),
                                                   blob->getData(), isSplat)) {
      return std::nullopt;
    }

    return blob->getDataAs<T>();
  }

  return std::nullopt;
}

template <typename RangeType>
mlir::DenseElementsAttr
transposeType(const RangeType &data, mlir::ShapedType inputType,
              mlir::ShapedType outputType, llvm::ArrayRef<int64_t> permValues) {
  using ElementType = std::decay_t<decltype(*std::begin(data))>;

  assert(inputType.getElementType() == outputType.getElementType());

  if (inputType.getNumElements() == 0)
    return mlir::DenseElementsAttr::get(outputType,
                                        llvm::ArrayRef<ElementType>{});

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

  return mlir::DenseElementsAttr::get(
      outputType, llvm::ArrayRef<ElementType>(outputValues));
}

mlir::DenseElementsAttr transpose(mlir::ElementsAttr attr,
                                  mlir::ShapedType inputType,
                                  mlir::ShapedType outputType,
                                  llvm::ArrayRef<int64_t> permValues) {
  if (mlir::isa<mlir::DenseResourceElementsAttr>(attr)) {
    auto elementTy = attr.getElementType();
    // TODO: Add support for other types (int, other float types)
    if (elementTy.isF32()) {
        auto data = tryGetDenseResourceValues<float>(attr);
        if (data)
            return transposeType(*data, inputType, outputType, permValues);
    }
  }
  // TODO: Handle DenseElementsAttr if needed

  return nullptr;
}

// --- Implementation of the pattern's matchAndRewrite --- 
mlir::LogicalResult LinalgFoldConstantTranspose::matchAndRewrite(
    mlir::linalg::TransposeOp op, mlir::PatternRewriter &rewriter) const {

  // Get output type
  auto outputType = mlir::cast<mlir::ShapedType>(op.getType(0));

  // Check element type compatibility (adjust as needed)
  if (!outputType.getElementType().isIntOrIndexOrFloat())
    return mlir::failure();

  // Match input as a constant
  mlir::ElementsAttr inputValues;
  if (!matchPattern(op.getInput(), m_Constant(&inputValues)))
    return mlir::failure();

  // Make sure the constant input has only this transpose op as a user.
  // This avoids potentially duplicating large constants if the constant is used elsewhere.
  if (!llvm::hasSingleElement(op.getInput().getDefiningOp()->getUsers()))
    return mlir::failure();

  // Get permutation map
  auto permutations = op.getPermutation();

  // Get input type
  auto inputType = mlir::cast<mlir::ShapedType>(op.getInput().getType());

  // Perform the transpose on the constant data
  auto resultAttr = transpose(inputValues, inputType, outputType, permutations);
  if (!resultAttr) {
    // If transpose returns nullptr, it means the attribute type/element type wasn't supported
    return rewriter.notifyMatchFailure(
        op, "transpose utility failed (unsupported attribute or element type)");
  }

  // Replace the linalg.transpose op with the new constant
  rewriter.replaceOpWithNewOp<mlir::arith::ConstantOp>(op, outputType,
                                                       resultAttr);
  return mlir::success();
}

} // namespace nn_compiler 