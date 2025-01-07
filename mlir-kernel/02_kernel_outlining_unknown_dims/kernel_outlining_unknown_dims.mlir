func.func @main(%num_threads: index, %num_blocks: index) {
    %c1 = arith.constant 1 : index
    gpu.launch
        blocks(%0, %1, %2) in (%3 = %num_threads, %4 = %c1, %5 = %c1)
        threads(%6, %7, %8) in (%9 = %num_blocks, %10 = %c1, %11 = %c1) {
        gpu.printf "Hello from %d\n" %6 : index
        gpu.terminator
    }
    return
}
