#!/usr/bin/env bash
set -euxo pipefail

export MLIR_OPT=mlir-opt-18

$MLIR_OPT 01_memory.mlir --pass-pipeline="builtin.module(gpu-kernel-outlining)" -o 02_kernel_outlining.mlir

$MLIR_OPT 02_kernel_outlining.mlir      \
  --pass-pipeline="builtin.module(      \
    nvvm-attach-target{chip=sm_75 O=3}, \
    gpu.module(convert-gpu-to-nvvm{use-bare-ptr-memref-call-conv=true})     \
  )" -o 03_nvvm.mlir


$MLIR_OPT 03_nvvm.mlir --pass-pipeline="builtin.module(gpu-to-llvm{use-bare-pointers-for-host=true use-bare-pointers-for-kernels=true})" -o 04_llvm.mlir

$MLIR_OPT 04_llvm.mlir --pass-pipeline="builtin.module(gpu-module-to-binary)" -o 05_binary.mlir

mlir-translate-18 05_binary.mlir --mlir-to-llvmir -o 06_binary.ll
