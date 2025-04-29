#include "mlir/IR/MLIRContext.h"
#include "mlir/InitAllDialects.h"
#include "mlir/InitAllPasses.h"
#include "mlir/Support/FileUtilities.h"
#include "mlir/Tools/mlir-opt/MlirOptMain.h"

#include "toynpu/Transforms/TransposeFolderPass.h"

int main(int argc, char **argv) {
  mlir::registerAllPasses();
  toynpu::registerTransposeFolderPass();

  mlir::DialectRegistry registry;
  registerAllDialects(registry);

  return mlir::asMainReturnCode(
      mlir::MlirOptMain(argc, argv, "Compiler optimizer driver\n", registry));
}
