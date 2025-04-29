#ifndef TOYNPU_OPS_H
#define TOYNPU_OPS_H

#include "mlir/IR/BuiltinTypes.h"
#include "mlir/IR/Dialect.h"
#include "mlir/IR/OpDefinition.h"

#define GET_OP_CLASSES
#include "ToyNPU/ToyNPUOps.h.inc"

#endif // TOYNPU_OPS_H
