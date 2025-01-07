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
    llvm.func @main_kernel(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: i64, %arg3: i64, %arg4: i64, %arg5: f32, %arg6: !llvm.ptr, %arg7: !llvm.ptr, %arg8: i64, %arg9: i64, %arg10: i64) attributes {gpu.kernel, gpu.known_block_size = array<i32: 10, 1, 1>, gpu.known_grid_size = array<i32: 1, 1, 1>, nvvm.kernel, nvvm.maxntid = array<i32: 10, 1, 1>} {
      %0 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
      %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
      %2 = llvm.insertvalue %arg1, %1[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
      %3 = llvm.insertvalue %arg2, %2[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
      %4 = llvm.insertvalue %arg3, %3[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
      %5 = llvm.insertvalue %arg4, %4[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
      %6 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
      %7 = llvm.insertvalue %arg6, %6[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
      %8 = llvm.insertvalue %arg7, %7[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
      %9 = llvm.insertvalue %arg8, %8[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
      %10 = llvm.insertvalue %arg9, %9[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
      %11 = llvm.insertvalue %arg10, %10[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
      llvm.br ^bb1
    ^bb1:  // pred: ^bb0
      %12 = nvvm.read.ptx.sreg.tid.x : i32
      %13 = llvm.sext %12 : i32 to i64
      %14 = llvm.extractvalue %5[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
      %15 = llvm.getelementptr %14[%13] : (!llvm.ptr, i64) -> !llvm.ptr, f32
      %16 = llvm.load %15 : !llvm.ptr -> f32
      %17 = llvm.fadd %16, %arg5  : f32
      %18 = llvm.extractvalue %11[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
      %19 = llvm.getelementptr %18[%13] : (!llvm.ptr, i64) -> !llvm.ptr, f32
      llvm.store %17, %19 : f32, !llvm.ptr
      llvm.return
    }
  }
}

