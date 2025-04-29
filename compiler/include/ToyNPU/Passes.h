#ifndef TOYNPU_PASSES_H
#define TOYNPU_PASSES_H

#include "mlir/Pass/Pass.h"

namespace toynpu {
#define GEN_PASS_DECL
#include "ToyNPU/Passes.h.inc"

#define GEN_PASS_REGISTRATION
#include "ToyNPU/Passes.h.inc"
} // namespace toynpu

#endif // TOYNPU_PASSES_H
