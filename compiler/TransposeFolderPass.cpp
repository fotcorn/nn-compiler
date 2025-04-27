#include "TransposeFolderPass.h"
#include "Transforms/TransposeFolder.h"

#include "mlir/Dialect/Func/IR/FuncOps.h"
#include "mlir/Dialect/Linalg/IR/Linalg.h"
#include "mlir/IR/PatternMatch.h"
#include "mlir/Pass/Pass.h"
#include "mlir/Transforms/GreedyPatternRewriteDriver.h"

namespace nn_compiler {

namespace {
// Define the pass struct inheriting from MLIR pass infrastructure
struct TransposeFolderPass
    : public mlir::PassWrapper<TransposeFolderPass,
                               mlir::OperationPass<mlir::func::FuncOp>> {
  MLIR_DEFINE_EXPLICIT_INTERNAL_INLINE_TYPE_ID(TransposeFolderPass)

  // Return the command-line argument for the pass
  llvm::StringRef getArgument() const final { return "transpose-folder"; }
  // Return a brief description of the pass
  llvm::StringRef getDescription() const final {
    return "Folds constant transpose operations using nn_compiler patterns";
  }

  // The core logic of the pass
  void runOnOperation() override {
    mlir::RewritePatternSet patterns(&getContext());
    // Add the pattern defined in nn_compiler namespace
    patterns.add<nn_compiler::LinalgFoldConstantTranspose>(&getContext());

    // Apply the patterns greedily
    if (failed(mlir::applyPatternsAndFoldGreedily(getOperation(),
                                                  std::move(patterns)))) {
      signalPassFailure(); // Signal failure if pattern application fails
    }
  }
};
} // namespace

// Function to create an instance of the pass
std::unique_ptr<mlir::Pass> createTransposeFolderPass() {
  return std::make_unique<TransposeFolderPass>();
}

// Function to register the pass with the MLIR pass manager
void registerTransposeFolderPass() {
  mlir::PassRegistration<TransposeFolderPass>();
}

} // namespace nn_compiler
