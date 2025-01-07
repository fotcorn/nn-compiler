#!/usr/bin/env bash
mlir-opt-18 kernel_outlining.mlir --pass-pipeline="builtin.module(gpu-kernel-outlining)" -o kernel_outlining_out.mlir

