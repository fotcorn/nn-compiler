func.func @main(%host_mem_in: memref<10xf32>, %host_mem_out: memref<10xf32>) {
    %c2 = arith.constant 2 : index
    %c1 = arith.constant 1 : index
    %c10 = arith.constant 10 : index
    %c10f = arith.constant 10.0 : f32

    %gpu_mem_in = gpu.alloc host_shared () : memref<10xf32>
    %gpu_mem_out = gpu.alloc host_shared () : memref<10xf32>
    %t0 = gpu.wait async
    %t1 = gpu.memcpy async [%t0] %gpu_mem_in, %host_mem_in : memref<10xf32>, memref<10xf32>
    gpu.wait [%t1]

    gpu.launch
        blocks(%0, %1, %2) in (%3 = %c1, %4 = %c1, %5 = %c1)
        threads(%6, %7, %8) in (%9 = %c10, %10 = %c1, %11 = %c1) {
        
        %tid = gpu.thread_id x

        %val = memref.load %gpu_mem_in[%tid] : memref<10xf32>
        %val_out = arith.addf %val, %c10f : f32
        memref.store %val_out, %gpu_mem_out[%tid] : memref<10xf32>
      
        gpu.terminator
    }

    %t2 = gpu.wait async
    %t3 = gpu.memcpy async [%t2] %host_mem_out, %gpu_mem_out : memref<10xf32>, memref<10xf32>
    gpu.wait [%t3]

    return
}
