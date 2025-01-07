#!/usr/bin/env bash
set -euxo pipefail

export MLIR_DIR=../../../llvm-project-mlir/build-debug/install/

$MLIR_DIR/bin/mlir-cpu-runner -e=main --entry-point-result=void 02_llvm.mlir --shared-libs=$MLIR_DIR/lib/libmlir_cuda_runtime.so --shared-libs=$MLIR_DIR/lib/libmlir_runner_utils.so
