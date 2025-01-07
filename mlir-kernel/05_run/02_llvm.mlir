module attributes {gpu.container_module} {
  llvm.func @malloc(i64) -> !llvm.ptr
  llvm.func @main() {
    %0 = llvm.mlir.constant(0 : index) : i64
    %1 = llvm.mlir.constant(1 : index) : i64
    %2 = llvm.mlir.constant(2 : index) : i64
    %3 = llvm.mlir.constant(10 : index) : i64
    %4 = llvm.mlir.constant(1.000000e+01 : f32) : f32
    %5 = llvm.mlir.constant(10 : index) : i64
    %6 = llvm.mlir.constant(1 : index) : i64
    %7 = llvm.mlir.zero : !llvm.ptr
    %8 = llvm.getelementptr %7[10] : (!llvm.ptr) -> !llvm.ptr, f32
    %9 = llvm.ptrtoint %8 : !llvm.ptr to i64
    %10 = llvm.call @malloc(%9) : (i64) -> !llvm.ptr
    %11 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %12 = llvm.insertvalue %10, %11[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %13 = llvm.insertvalue %10, %12[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %14 = llvm.mlir.constant(0 : index) : i64
    %15 = llvm.insertvalue %14, %13[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %16 = llvm.insertvalue %5, %15[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %17 = llvm.insertvalue %6, %16[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %18 = llvm.mlir.constant(10 : index) : i64
    %19 = llvm.mlir.constant(1 : index) : i64
    %20 = llvm.mlir.zero : !llvm.ptr
    %21 = llvm.getelementptr %20[10] : (!llvm.ptr) -> !llvm.ptr, f32
    %22 = llvm.ptrtoint %21 : !llvm.ptr to i64
    %23 = llvm.call @malloc(%22) : (i64) -> !llvm.ptr
    %24 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %25 = llvm.insertvalue %23, %24[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %26 = llvm.insertvalue %23, %25[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %27 = llvm.mlir.constant(0 : index) : i64
    %28 = llvm.insertvalue %27, %26[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %29 = llvm.insertvalue %18, %28[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %30 = llvm.insertvalue %19, %29[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.br ^bb1(%0 : i64)
  ^bb1(%31: i64):  // 2 preds: ^bb0, ^bb2
    %32 = llvm.icmp "slt" %31, %3 : i64
    llvm.cond_br %32, ^bb2, ^bb3
  ^bb2:  // pred: ^bb1
    %33 = llvm.trunc %31 : i64 to i32
    %34 = llvm.sitofp %33 : i32 to f32
    %35 = llvm.getelementptr %10[%31] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %34, %35 : f32, !llvm.ptr
    %36 = llvm.add %31, %1  : i64
    llvm.br ^bb1(%36 : i64)
  ^bb3:  // pred: ^bb1
    %37 = llvm.mlir.constant(10 : index) : i64
    %38 = llvm.mlir.constant(1 : index) : i64
    %39 = llvm.mlir.zero : !llvm.ptr
    %40 = llvm.getelementptr %39[10] : (!llvm.ptr) -> !llvm.ptr, f32
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
    %52 = llvm.mlir.constant(10 : index) : i64
    %53 = llvm.mlir.constant(1 : index) : i64
    %54 = llvm.mlir.zero : !llvm.ptr
    %55 = llvm.getelementptr %54[10] : (!llvm.ptr) -> !llvm.ptr, f32
    %56 = llvm.ptrtoint %55 : !llvm.ptr to i64
    %57 = llvm.mlir.zero : !llvm.ptr
    %58 = llvm.mlir.constant(1 : i8) : i8
    %59 = llvm.call @mgpuMemAlloc(%56, %57, %58) : (i64, !llvm.ptr, i8) -> !llvm.ptr
    %60 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %61 = llvm.insertvalue %59, %60[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %62 = llvm.insertvalue %59, %61[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %63 = llvm.mlir.constant(0 : index) : i64
    %64 = llvm.insertvalue %63, %62[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %65 = llvm.insertvalue %52, %64[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %66 = llvm.insertvalue %53, %65[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %67 = llvm.call @mgpuStreamCreate() : () -> !llvm.ptr
    %68 = llvm.mlir.constant(10 : index) : i64
    %69 = llvm.mlir.zero : !llvm.ptr
    %70 = llvm.getelementptr %69[10] : (!llvm.ptr) -> !llvm.ptr, f32
    %71 = llvm.ptrtoint %70 : !llvm.ptr to i64
    llvm.call @mgpuMemcpy(%44, %10, %71, %67) : (!llvm.ptr, !llvm.ptr, i64, !llvm.ptr) -> ()
    llvm.call @mgpuStreamSynchronize(%67) : (!llvm.ptr) -> ()
    llvm.call @mgpuStreamDestroy(%67) : (!llvm.ptr) -> ()
    gpu.launch_func  @main_kernel::@main_kernel blocks in (%1, %1, %1) threads in (%3, %1, %1) : i64 args(%44 : !llvm.ptr, %4 : f32, %59 : !llvm.ptr)
    %72 = llvm.call @mgpuStreamCreate() : () -> !llvm.ptr
    %73 = llvm.mlir.constant(10 : index) : i64
    %74 = llvm.mlir.zero : !llvm.ptr
    %75 = llvm.getelementptr %74[10] : (!llvm.ptr) -> !llvm.ptr, f32
    %76 = llvm.ptrtoint %75 : !llvm.ptr to i64
    llvm.call @mgpuMemcpy(%23, %59, %76, %72) : (!llvm.ptr, !llvm.ptr, i64, !llvm.ptr) -> ()
    llvm.call @mgpuStreamSynchronize(%72) : (!llvm.ptr) -> ()
    llvm.call @mgpuStreamDestroy(%72) : (!llvm.ptr) -> ()
    %77 = llvm.mlir.constant(1 : index) : i64
    %78 = llvm.alloca %77 x !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr
    llvm.store %30, %78 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, !llvm.ptr
    %79 = llvm.mlir.constant(1 : index) : i64
    %80 = llvm.mlir.undef : !llvm.struct<(i64, ptr)>
    %81 = llvm.insertvalue %79, %80[0] : !llvm.struct<(i64, ptr)> 
    %82 = llvm.insertvalue %78, %81[1] : !llvm.struct<(i64, ptr)> 
    %83 = llvm.extractvalue %82[0] : !llvm.struct<(i64, ptr)> 
    %84 = llvm.extractvalue %82[1] : !llvm.struct<(i64, ptr)> 
    llvm.call @printMemrefF32(%83, %84) : (i64, !llvm.ptr) -> ()
    llvm.return
  }
  gpu.binary @main_kernel  [#gpu.object<#nvvm.target<O = 3, chip = "sm_75">, "P\EDU\BA\01\00\10\00\C0\0C\00\00\00\00\00\00\02\00\01\01@\00\00\00\A8\0A\00\00\00\00\00\00\00\00\00\00\00\00\00\00\07\00\01\00K\00\00\00\00\00\00\00\00\00\00\00\11\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\7FELF\02\01\013\07\00\00\00\00\00\00\00\02\00\BE\00~\00\00\00\00\00\00\00\00\00\00\00\00\0A\00\00\00\00\00\00\00\07\00\00\00\00\00\00K\05K\00@\008\00\03\00@\00\0C\00\01\00\00.shstrtab\00.strtab\00.symtab\00.symtab_shndx\00.nv.info\00.text.main_kernel\00.nv.info.main_kernel\00.nv.shared.main_kernel\00.nv.constant0.main_kernel\00.rel.nv.constant0.main_kernel\00.debug_frame\00.rel.debug_frame\00.rela.debug_frame\00.nv.callgraph\00.nv.prototype\00.nv.rel.action\00\00.shstrtab\00.strtab\00.symtab\00.symtab_shndx\00.nv.info\00.text.main_kernel\00.nv.info.main_kernel\00.nv.shared.main_kernel\00.rel.nv.constant0.main_kernel\00.nv.constant0.main_kernel\00.debug_frame\00.rel.debug_frame\00.rela.debug_frame\00.nv.callgraph\00.nv.prototype\00.nv.rel.action\00main_kernel\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\002\00\00\00\03\00\0B\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\8E\00\00\00\03\00\0A\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\A8\00\00\00\03\00\04\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\D8\00\00\00\03\00\07\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\F4\00\00\00\03\00\08\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\03\01\00\00\12\10\0B\00\00\00\00\00\00\00\00\00\00\01\00\00\00\00\00\00\FF\FF\FF\FF$\00\00\00\00\00\00\00\FF\FF\FF\FF\FF\FF\FF\FF\03\00\04|\FF\FF\FF\FF\0F\0C\81\80\80(\00\08\FF\81\80(\08\81\80\80(\00\00\00\FF\FF\FF\FF4\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\00\00\00\04\04\00\00\00\04 \00\00\00\0C\81\80\80(\00\04\FC\FF\FF?\00\00\00\00\00\00\00\04/\08\00\06\00\00\00\0A\00\00\00\04\11\08\00\06\00\00\00\00\00\00\00\04\12\08\00\06\00\00\00\00\00\00\00\046\04\00\01\00\00\00\047\04\00~\00\00\00\04\0A\08\00\02\00\00\00`\01\18\00\03\19\18\00\04\17\0C\00\00\00\00\00\02\00\10\00\00\F0!\00\04\17\0C\00\00\00\00\00\01\00\08\00\00\F0\11\00\04\17\0C\00\00\00\00\00\00\00\00\00\00\F0!\00\03\1B\FF\00\04\1C\04\00\80\00\00\00\04\05\0C\00\0A\00\00\00\01\00\00\00\01\00\00\00\00\00\00\00\FF\FF\FF\FF\00\00\00\00\FE\FF\FF\FF\00\00\00\00\FD\FF\FF\FF\00\00\00\00\FC\FF\FF\FFs\00\00\00\00\00\00\00\00\00\00\11%\00\056D\00\00\00\00\00\00\00\02\00\00\00\06\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\02z\01\00\00\0A\00\00\00\0F\00\00\00\E4\0F\00\19y\04\00\00\00\00\00\00!\00\00\00\22\0E\00\02x\05\00\04\00\00\00\00\0F\00\00\00\CA\0F\00%v\02\04\00X\00\00\05\02\8E\07\00\D0\1F\00\81s\02\02\00\00\00\00\00\E9\1E\00\00\A2\0E\00%v\04\04\00\\\00\00\05\02\8E\07\00\C8\0F\00!v\07\02\00Z\00\00\00\00\00\00\00\D0O\00\86s\00\04\07\00\00\00\00\E9\10\00\00\E2\0F\00My\00\00\00\00\00\00\00\00\80\03\00\EA\0F\00Gy\00\00\F0\FF\FF\FF\FF\FF\83\03\00\C0\0F\00\18y\00\00\00\00\00\00\00\00\00\00\00\C0\0F\00\18y\00\00\00\00\00\00\00\00\00\00\00\C0\0F\00\18y\00\00\00\00\00\00\00\00\00\00\00\C0\0F\00\18y\00\00\00\00\00\00\00\00\00\00\00\C0\0F\00\18y\00\00\00\00\00\00\00\00\00\00\00\C0\0F\00\18y\00\00\00\00\00\00\00\00\00\00\00\C0\0F\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\03\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00@\00\00\00\00\00\00\00\03\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\0B\00\00\00\03\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00C\01\00\00\00\00\00\00\0F\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\13\00\00\00\02\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00X\02\00\00\00\00\00\00\A8\00\00\00\00\00\00\00\02\00\00\00\06\00\00\00\08\00\00\00\00\00\00\00\18\00\00\00\00\00\00\00\A8\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\03\00\00\00\00\00\00p\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00)\00\00\00\00\00\00p\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00p\03\00\00\00\00\00\00$\00\00\00\00\00\00\00\03\00\00\00\00\00\00\00\04\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00D\00\00\00\00\00\00p@\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\94\03\00\00\00\00\00\00l\00\00\00\00\00\00\00\03\00\00\00\0B\00\00\00\04\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\D8\00\00\00\01\00\00p\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\04\00\00\00\00\00\00 \00\00\00\00\00\00\00\03\00\00\00\00\00\00\00\04\00\00\00\00\00\00\00\08\00\00\00\00\00\00\00\F4\00\00\00\0B\00\00p\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00 \04\00\00\00\00\00\00\10\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\08\00\00\00\00\00\00\00\08\00\00\00\00\00\00\00\B5\00\00\00\09\00\00\00@\00\00\00\00\00\00\00\00\00\00\00\00\00\00\000\04\00\00\00\00\00\00\10\00\00\00\00\00\00\00\03\00\00\00\04\00\00\00\08\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00p\00\00\00\01\00\00\00B\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00@\04\00\00\00\00\00\00x\01\00\00\00\00\00\00\00\00\00\00\0B\00\00\00\04\00\00\00\00\00\00\00\00\00\00\00\00\00\00\002\00\00\00\01\00\00\00\06\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\06\00\00\00\00\00\00\00\01\00\00\00\00\00\00\03\00\00\00\06\00\00\0A\80\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\06\00\00\00\05\00\00\00\00\0A\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\A8\00\00\00\00\00\00\00\A8\00\00\00\00\00\00\00\08\00\00\00\00\00\00\00\01\00\00\00\05\00\00\00@\04\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\C0\02\00\00\00\00\00\00\C0\02\00\00\00\00\00\00\08\00\00\00\00\00\00\00\01\00\00\00\05\00\00\00\00\0A\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\A8\00\00\00\00\00\00\00\A8\00\00\00\00\00\00\00\08\00\00\00\00\00\00\00\01\00\01\01P\00\00\00\88\01\00\00\00\00\00\00\87\01\00\00@\00\00\00\03\00\06\00K\00\00\00\00\00\00\00\00\00\00\00\11 \00\00\00\00\00\00\00\00\00\00\00\00\00\00{\02\00\00\00\00\00\00H\00\00\00\00\00\00\00\00\00\00\00\00\00\00\000\0A//\03\00\F3\1E\0A.version 6.3\0A.target sm_75\0A.address_size 64\0A1\00\F8\17isible .entry main_kernel(\0A.param .u64\19\00\11_\17\005_0,!\00?f32!\00\00/1,B\00\0C\F3\192\0A)\0A.maxntid 10, 1, 1\0A{\0A.reg .b32 %r<2>;\11\00\00f\00E%f<4\11\00\F2\00b64 %rd<8>;\0A\0Aldm\00\22.u\16\00N1, [s\00=0];*\00\1F2*\00\02\F4\032];\0Acvta.to.global0\00!3,6\00\07I\00\02\9A\00\0Fr\00\03\1F1H\00\06\114H\00\801;\0Amov.uC\00\F1\07r1, %tid.x;\0Amul.wide.s\1A\002d5, \00\824;\0Aadd.sD\00&6,J\00\115\92\00\03d\00\02\93\00\00\DB\00\00&\00\12]5\00#rn\18\00\223,\1D\009%f1O\00&7,\E1\00X5;\0AstO\00\00J\00 7]5\00\C03;\0Aret;\0A\0A}\0A\00\00">]
  llvm.func @printMemrefF32(i64, !llvm.ptr) attributes {sym_visibility = "private"}
  llvm.func @mgpuMemAlloc(i64, !llvm.ptr, i8) -> !llvm.ptr
  llvm.func @mgpuStreamCreate() -> !llvm.ptr
  llvm.func @mgpuMemcpy(!llvm.ptr, !llvm.ptr, i64, !llvm.ptr)
  llvm.func @mgpuStreamSynchronize(!llvm.ptr)
  llvm.func @mgpuStreamDestroy(!llvm.ptr)
}

