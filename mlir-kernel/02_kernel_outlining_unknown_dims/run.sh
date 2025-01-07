#!/usr/bin/env bash
mlir-opt-18 kernel_outlining_unknown_dims.mlir --pass-pipeline="builtin.module(gpu-kernel-outlining)" -o kernel_outlining_unknown_dims_out.mlir
