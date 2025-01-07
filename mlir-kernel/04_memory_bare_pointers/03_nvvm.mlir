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
  gpu.module @main_kernel [#nvvm.target<O = 3, chip = "sm_75">]  {
    llvm.func @main_kernel(%arg0: !llvm.ptr, %arg1: f32, %arg2: !llvm.ptr) attributes {gpu.kernel, gpu.known_block_size = array<i32: 10, 1, 1>, gpu.known_grid_size = array<i32: 1, 1, 1>, nvvm.kernel, nvvm.maxntid = array<i32: 10, 1, 1>} {
      %0 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
      %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
      %2 = llvm.insertvalue %arg0, %1[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
      %3 = llvm.mlir.constant(0 : index) : i64
      %4 = llvm.insertvalue %3, %2[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
      %5 = llvm.mlir.constant(10 : index) : i64
      %6 = llvm.insertvalue %5, %4[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
      %7 = llvm.mlir.constant(1 : index) : i64
      %8 = llvm.insertvalue %7, %6[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
      %9 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
      %10 = llvm.insertvalue %arg2, %9[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
      %11 = llvm.insertvalue %arg2, %10[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
      %12 = llvm.mlir.constant(0 : index) : i64
      %13 = llvm.insertvalue %12, %11[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
      %14 = llvm.mlir.constant(10 : index) : i64
      %15 = llvm.insertvalue %14, %13[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
      %16 = llvm.mlir.constant(1 : index) : i64
      %17 = llvm.insertvalue %16, %15[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
      llvm.br ^bb1
    ^bb1:  // pred: ^bb0
      %18 = nvvm.read.ptx.sreg.tid.x : i32
      %19 = llvm.sext %18 : i32 to i64
      %20 = llvm.extractvalue %8[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
      %21 = llvm.getelementptr %20[%19] : (!llvm.ptr, i64) -> !llvm.ptr, f32
      %22 = llvm.load %21 : !llvm.ptr -> f32
      %23 = llvm.fadd %22, %arg1  : f32
      %24 = llvm.extractvalue %17[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
      %25 = llvm.getelementptr %24[%19] : (!llvm.ptr, i64) -> !llvm.ptr, f32
      llvm.store %23, %25 : f32, !llvm.ptr
      llvm.return
    }
  }
}

