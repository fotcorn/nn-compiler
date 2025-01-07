module attributes {gpu.container_module} {
  func.func @main(%arg0: index, %arg1: index) {
    %c1 = arith.constant 1 : index
    gpu.launch_func  @main_kernel::@main_kernel blocks in (%arg0, %c1, %c1) threads in (%arg1, %c1, %c1)  
    return
  }
  gpu.module @main_kernel {
    gpu.func @main_kernel() kernel {
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
      gpu.printf "Hello from %d\0A" %3 : index
      gpu.return
    }
  }
}

