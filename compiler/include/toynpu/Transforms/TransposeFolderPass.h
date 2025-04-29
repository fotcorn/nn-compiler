#ifndef COMPILER_TRANSPOSEFOLDERPASS_H
#define COMPILER_TRANSPOSEFOLDERPASS_H

#include "mlir/Pass/Pass.h"
#include <memory> // For std::unique_ptr

// Forward declare Pass in the mlir namespace if needed, or include the
// definition directly
namespace mlir {
class Pass;
} // namespace mlir

namespace toynpu {

// Pass registration function
void registerTransposeFolderPass();

// Pass creation function
std::unique_ptr<mlir::Pass> createTransposeFolderPass();

} // namespace toynpu

#endif // COMPILER_TRANSPOSEFOLDERPASS_H