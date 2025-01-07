module attributes {gpu.container_module} {
  func.func @main(%arg0: memref<10xf32>, %arg1: memref<10xf32>) {
    %c2 = arith.constant 2 : index
    %c1 = arith.constant 1 : index
    %c10 = arith.constant 10 : index
    %cst = arith.constant 1.000000e+01 : f32
    %memref = gpu.alloc  host_shared () : memref<10xf32>
    %memref_0 = gpu.alloc  host_shared () : memref<10xf32>
    %0 = gpu.wait async
    %1 = gpu.memcpy async [%0] %memref, %arg0 : memref<10xf32>, memref<10xf32>
    gpu.wait [%1]
    gpu.launch_func  @main_kernel::@main_kernel blocks in (%c1, %c1, %c1) threads in (%c10, %c1, %c1)  args(%memref : memref<10xf32>, %cst : f32, %memref_0 : memref<10xf32>)
    %2 = gpu.wait async
    %3 = gpu.memcpy async [%2] %arg1, %memref_0 : memref<10xf32>, memref<10xf32>
    gpu.wait [%3]
    return
  }
  gpu.module @main_kernel {
    gpu.func @main_kernel(%arg0: memref<10xf32>, %arg1: f32, %arg2: memref<10xf32>) kernel attributes {gpu.known_block_size = array<i32: 10, 1, 1>, gpu.known_grid_size = array<i32: 1, 1, 1>} {
      %0 = gpu.block_id  x
      %1 = gpu.block_id  y
      %2 = gpu.block_id  z
      %3 = gpu.thread_id  x
      %4 = gpu.thread_id  y
      %5 = gpu.thread_id  z
      %6 = gpu.grid_dim  x
      %7 = gpu.grid_dim  y
      %8 = gpu.grid_dim  z
      %9 = gpu.block_dim  x
      %10 = gpu.block_dim  y
      %11 = gpu.block_dim  z
      cf.br ^bb1
    ^bb1:  // pred: ^bb0
      %12 = gpu.thread_id  x
      %13 = memref.load %arg0[%12] : memref<10xf32>
      %14 = arith.addf %13, %arg1 : f32
      memref.store %14, %arg2[%12] : memref<10xf32>
      gpu.return
    }
  }
}

