#!/usr/bin/env bash
set -euxo pipefail

mlir-opt-18 01_run.mlir \
  --pass-pipeline="builtin.module(      \
    gpu-kernel-outlining,               \
    nvvm-attach-target{chip=sm_75 O=3},         \
    gpu.module(convert-gpu-to-nvvm{use-bare-ptr-memref-call-conv=true}), \
    convert-scf-to-cf,                          \
    convert-cf-to-llvm,                         \
    convert-func-to-llvm,                       \
    gpu-to-llvm{use-bare-pointers-for-host=true use-bare-pointers-for-kernels=true}, \
    gpu-module-to-binary,                       \
    reconcile-unrealized-casts                  \
  )" -o 02_llvm.mlir
