// Run with:
// cat examples/02_remark.mlir examples/01_transpose_folded.mlir | mlir-opt --pass-pipeline="builtin.module(transform-interpreter{debug-bind-trailing-args=linalg.matmul,linalg.elemwise_binary})" > /dev/null

module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(
            %arg0: !transform.any_op,
            %arg1: !transform.op<"linalg.matmul">,
            %arg2: !transform.op<"linalg.elemwise_binary">) {
        transform.debug.emit_remark_at %arg1, "matmul" : !transform.op<"linalg.matmul">
        transform.debug.emit_remark_at %arg2, "elemwise_binaries" : !transform.op<"linalg.elemwise_binary">
        transform.yield
    }
}
