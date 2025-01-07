module attributes {gpu.container_module} {
  llvm.func @main(%arg0: !llvm.ptr, %arg1: !llvm.ptr) {
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
    %10 = llvm.insertvalue %arg1, %9[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %11 = llvm.insertvalue %arg1, %10[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %12 = llvm.mlir.constant(0 : index) : i64
    %13 = llvm.insertvalue %12, %11[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %14 = llvm.mlir.constant(10 : index) : i64
    %15 = llvm.insertvalue %14, %13[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %16 = llvm.mlir.constant(1 : index) : i64
    %17 = llvm.insertvalue %16, %15[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %18 = llvm.mlir.constant(2 : index) : i64
    %19 = llvm.mlir.constant(1 : index) : i64
    %20 = llvm.mlir.constant(10 : index) : i64
    %21 = llvm.mlir.constant(1.000000e+01 : f32) : f32
    %22 = llvm.mlir.constant(10 : index) : i64
    %23 = llvm.mlir.constant(1 : index) : i64
    %24 = llvm.mlir.zero : !llvm.ptr
    %25 = llvm.getelementptr %24[%22] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %26 = llvm.ptrtoint %25 : !llvm.ptr to i64
    %27 = llvm.mlir.zero : !llvm.ptr
    %28 = llvm.mlir.constant(1 : i8) : i8
    %29 = llvm.call @mgpuMemAlloc(%26, %27, %28) : (i64, !llvm.ptr, i8) -> !llvm.ptr
    %30 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %31 = llvm.insertvalue %29, %30[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %32 = llvm.insertvalue %29, %31[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %33 = llvm.mlir.constant(0 : index) : i64
    %34 = llvm.insertvalue %33, %32[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %35 = llvm.insertvalue %22, %34[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %36 = llvm.insertvalue %23, %35[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %37 = llvm.mlir.constant(10 : index) : i64
    %38 = llvm.mlir.constant(1 : index) : i64
    %39 = llvm.mlir.zero : !llvm.ptr
    %40 = llvm.getelementptr %39[%37] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %41 = llvm.ptrtoint %40 : !llvm.ptr to i64
    %42 = llvm.mlir.zero : !llvm.ptr
    %43 = llvm.mlir.constant(1 : i8) : i8
    %44 = llvm.call @mgpuMemAlloc(%41, %42, %43) : (i64, !llvm.ptr, i8) -> !llvm.ptr
    %45 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %46 = llvm.insertvalue %44, %45[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %47 = llvm.insertvalue %44, %46[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %48 = llvm.mlir.constant(0 : index) : i64
    %49 = llvm.insertvalue %48, %47[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %50 = llvm.insertvalue %37, %49[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %51 = llvm.insertvalue %38, %50[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %52 = llvm.call @mgpuStreamCreate() : () -> !llvm.ptr
    %53 = llvm.mlir.constant(10 : index) : i64
    %54 = llvm.mlir.zero : !llvm.ptr
    %55 = llvm.getelementptr %54[%53] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %56 = llvm.ptrtoint %55 : !llvm.ptr to i64
    %57 = llvm.extractvalue %8[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %58 = llvm.extractvalue %36[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.call @mgpuMemcpy(%58, %57, %56, %52) : (!llvm.ptr, !llvm.ptr, i64, !llvm.ptr) -> ()
    llvm.call @mgpuStreamSynchronize(%52) : (!llvm.ptr) -> ()
    llvm.call @mgpuStreamDestroy(%52) : (!llvm.ptr) -> ()
    %59 = llvm.extractvalue %36[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %60 = llvm.extractvalue %51[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    gpu.launch_func  @main_kernel::@main_kernel blocks in (%19, %19, %19) threads in (%20, %19, %19) : i64 args(%59 : !llvm.ptr, %21 : f32, %60 : !llvm.ptr)
    %61 = llvm.call @mgpuStreamCreate() : () -> !llvm.ptr
    %62 = llvm.mlir.constant(10 : index) : i64
    %63 = llvm.mlir.zero : !llvm.ptr
    %64 = llvm.getelementptr %63[%62] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %65 = llvm.ptrtoint %64 : !llvm.ptr to i64
    %66 = llvm.extractvalue %51[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %67 = llvm.extractvalue %17[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.call @mgpuMemcpy(%67, %66, %65, %61) : (!llvm.ptr, !llvm.ptr, i64, !llvm.ptr) -> ()
    llvm.call @mgpuStreamSynchronize(%61) : (!llvm.ptr) -> ()
    llvm.call @mgpuStreamDestroy(%61) : (!llvm.ptr) -> ()
    llvm.return
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
  llvm.func @mgpuMemAlloc(i64, !llvm.ptr, i8) -> !llvm.ptr
  llvm.func @mgpuStreamCreate() -> !llvm.ptr
  llvm.func @mgpuMemcpy(!llvm.ptr, !llvm.ptr, i64, !llvm.ptr)
  llvm.func @mgpuStreamSynchronize(!llvm.ptr)
  llvm.func @mgpuStreamDestroy(!llvm.ptr)
}

