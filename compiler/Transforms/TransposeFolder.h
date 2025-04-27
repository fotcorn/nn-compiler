#ifndef COMPILER_TRANSFORMS_TRANSPOSEFOLDER_H
#define COMPILER_TRANSFORMS_TRANSPOSEFOLDER_H

#include "mlir/Dialect/Linalg/IR/Linalg.h"
#include "mlir/IR/PatternMatch.h"
#include "mlir/IR/Value.h"
#include "llvm/ADT/ArrayRef.h"

namespace mlir {
class ElementsAttr;
class ShapedType;
class DenseElementsAttr;
class PatternRewriter;
} // namespace mlir

namespace nn_compiler {

// Forward declaration
mlir::DenseElementsAttr transpose(mlir::ElementsAttr attr,
                                  mlir::ShapedType inputType,
                                  mlir::ShapedType outputType,
                                  llvm::ArrayRef<int64_t> permValues);

// Declare the pattern within the nn_compiler namespace
struct LinalgFoldConstantTranspose
    : public mlir::OpRewritePattern<mlir::linalg::TransposeOp> {
  using OpRewritePattern::OpRewritePattern;

  mlir::LogicalResult
  matchAndRewrite(mlir::linalg::TransposeOp op,
                  mlir::PatternRewriter &rewriter) const override;
};

} // namespace nn_compiler

#endif // COMPILER_TRANSFORMS_TRANSPOSEFOLDER_H 