#ifndef TOYNPU_PASSES
#define TOYNPU_PASSES

include "mlir/Pass/PassBase.td"

def TransposeFolderPass : Pass<"transpose-folder", "mlir::func::FuncOp"> {
  let summary = "Folds transpose operations on constant dialect resources";
  let dependentDialects = [
    "mlir::linalg::LinalgDialect"
  ];
}

#endif // TOYNPU_PASSES
