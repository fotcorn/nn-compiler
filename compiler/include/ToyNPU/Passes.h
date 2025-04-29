//===- Passes.h - ToyNPU Transform Pass Entrypoints ----------*- C++ -*-===//
//
// Part of the ToyNPU project
//
//===----------------------------------------------------------------------===//
//
// This header file defines prototypes for ToyNPU transform passes.
//
//===----------------------------------------------------------------------===//

#ifndef TOYNPU_TRANSFORMS_PASSES_H
#define TOYNPU_TRANSFORMS_PASSES_H

#include "mlir/Pass/Pass.h"

namespace toynpu {
#define GEN_PASS_DECL
#include "ToyNPU/Passes.h.inc"

#define GEN_PASS_REGISTRATION
#include "ToyNPU/Passes.h.inc"
} // namespace toynpu

#endif // TOYNPU_TRANSFORMS_PASSES_H
