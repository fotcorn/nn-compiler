//===-- Passes.td - Transform pass definition file ---------*- tablegen -*-===//
//
// Part of the ToyNPU project
//
//===----------------------------------------------------------------------===//

#ifndef TOYNPU_TRANSFORMS_PASSES
#define TOYNPU_TRANSFORMS_PASSES

include "mlir/Pass/PassBase.td"

def TransposeFolderPass : Pass<"transpose-folder", "mlir::func::FuncOp"> {
  let summary = "Folds transpose operations on constant dialect resources";
  let dependentDialects = [
    "mlir::linalg::LinalgDialect"
  ];
}

#endif // TOYNPU_TRANSFORMS_PASSES 
