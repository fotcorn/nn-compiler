; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

%0 = type { ptr, float, ptr }

@main_kernel_bin_cst = internal constant [3280 x i8] c"P\EDU\BA\01\00\10\00\C0\0C\00\00\00\00\00\00\02\00\01\01@\00\00\00\A8\0A\00\00\00\00\00\00\00\00\00\00\00\00\00\00\07\00\01\00K\00\00\00\00\00\00\00\00\00\00\00\11\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\7FELF\02\01\013\07\00\00\00\00\00\00\00\02\00\BE\00~\00\00\00\00\00\00\00\00\00\00\00\00\0A\00\00\00\00\00\00\00\07\00\00\00\00\00\00K\05K\00@\008\00\03\00@\00\0C\00\01\00\00.shstrtab\00.strtab\00.symtab\00.symtab_shndx\00.nv.info\00.text.main_kernel\00.nv.info.main_kernel\00.nv.shared.main_kernel\00.nv.constant0.main_kernel\00.rel.nv.constant0.main_kernel\00.debug_frame\00.rel.debug_frame\00.rela.debug_frame\00.nv.callgraph\00.nv.prototype\00.nv.rel.action\00\00.shstrtab\00.strtab\00.symtab\00.symtab_shndx\00.nv.info\00.text.main_kernel\00.nv.info.main_kernel\00.nv.shared.main_kernel\00.rel.nv.constant0.main_kernel\00.nv.constant0.main_kernel\00.debug_frame\00.rel.debug_frame\00.rela.debug_frame\00.nv.callgraph\00.nv.prototype\00.nv.rel.action\00main_kernel\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\002\00\00\00\03\00\0B\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\8E\00\00\00\03\00\0A\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\A8\00\00\00\03\00\04\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\D8\00\00\00\03\00\07\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\F4\00\00\00\03\00\08\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\03\01\00\00\12\10\0B\00\00\00\00\00\00\00\00\00\00\01\00\00\00\00\00\00\FF\FF\FF\FF$\00\00\00\00\00\00\00\FF\FF\FF\FF\FF\FF\FF\FF\03\00\04|\FF\FF\FF\FF\0F\0C\81\80\80(\00\08\FF\81\80(\08\81\80\80(\00\00\00\FF\FF\FF\FF4\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\00\00\00\04\04\00\00\00\04 \00\00\00\0C\81\80\80(\00\04\FC\FF\FF?\00\00\00\00\00\00\00\04/\08\00\06\00\00\00\0A\00\00\00\04\11\08\00\06\00\00\00\00\00\00\00\04\12\08\00\06\00\00\00\00\00\00\00\046\04\00\01\00\00\00\047\04\00~\00\00\00\04\0A\08\00\02\00\00\00`\01\18\00\03\19\18\00\04\17\0C\00\00\00\00\00\02\00\10\00\00\F0!\00\04\17\0C\00\00\00\00\00\01\00\08\00\00\F0\11\00\04\17\0C\00\00\00\00\00\00\00\00\00\00\F0!\00\03\1B\FF\00\04\1C\04\00\80\00\00\00\04\05\0C\00\0A\00\00\00\01\00\00\00\01\00\00\00\00\00\00\00\FF\FF\FF\FF\00\00\00\00\FE\FF\FF\FF\00\00\00\00\FD\FF\FF\FF\00\00\00\00\FC\FF\FF\FFs\00\00\00\00\00\00\00\00\00\00\11%\00\056D\00\00\00\00\00\00\00\02\00\00\00\06\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\02z\01\00\00\0A\00\00\00\0F\00\00\00\E4\0F\00\19y\04\00\00\00\00\00\00!\00\00\00\22\0E\00\02x\05\00\04\00\00\00\00\0F\00\00\00\CA\0F\00%v\02\04\00X\00\00\05\02\8E\07\00\D0\1F\00\81s\02\02\00\00\00\00\00\E9\1E\00\00\A2\0E\00%v\04\04\00\\\00\00\05\02\8E\07\00\C8\0F\00!v\07\02\00Z\00\00\00\00\00\00\00\D0O\00\86s\00\04\07\00\00\00\00\E9\10\00\00\E2\0F\00My\00\00\00\00\00\00\00\00\80\03\00\EA\0F\00Gy\00\00\F0\FF\FF\FF\FF\FF\83\03\00\C0\0F\00\18y\00\00\00\00\00\00\00\00\00\00\00\C0\0F\00\18y\00\00\00\00\00\00\00\00\00\00\00\C0\0F\00\18y\00\00\00\00\00\00\00\00\00\00\00\C0\0F\00\18y\00\00\00\00\00\00\00\00\00\00\00\C0\0F\00\18y\00\00\00\00\00\00\00\00\00\00\00\C0\0F\00\18y\00\00\00\00\00\00\00\00\00\00\00\C0\0F\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\03\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00@\00\00\00\00\00\00\00\03\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\0B\00\00\00\03\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00C\01\00\00\00\00\00\00\0F\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\13\00\00\00\02\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00X\02\00\00\00\00\00\00\A8\00\00\00\00\00\00\00\02\00\00\00\06\00\00\00\08\00\00\00\00\00\00\00\18\00\00\00\00\00\00\00\A8\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\03\00\00\00\00\00\00p\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00)\00\00\00\00\00\00p\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00p\03\00\00\00\00\00\00$\00\00\00\00\00\00\00\03\00\00\00\00\00\00\00\04\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00D\00\00\00\00\00\00p@\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\94\03\00\00\00\00\00\00l\00\00\00\00\00\00\00\03\00\00\00\0B\00\00\00\04\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\D8\00\00\00\01\00\00p\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\04\00\00\00\00\00\00 \00\00\00\00\00\00\00\03\00\00\00\00\00\00\00\04\00\00\00\00\00\00\00\08\00\00\00\00\00\00\00\F4\00\00\00\0B\00\00p\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00 \04\00\00\00\00\00\00\10\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\08\00\00\00\00\00\00\00\08\00\00\00\00\00\00\00\B5\00\00\00\09\00\00\00@\00\00\00\00\00\00\00\00\00\00\00\00\00\00\000\04\00\00\00\00\00\00\10\00\00\00\00\00\00\00\03\00\00\00\04\00\00\00\08\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00p\00\00\00\01\00\00\00B\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00@\04\00\00\00\00\00\00x\01\00\00\00\00\00\00\00\00\00\00\0B\00\00\00\04\00\00\00\00\00\00\00\00\00\00\00\00\00\00\002\00\00\00\01\00\00\00\06\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\06\00\00\00\00\00\00\00\01\00\00\00\00\00\00\03\00\00\00\06\00\00\0A\80\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\06\00\00\00\05\00\00\00\00\0A\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\A8\00\00\00\00\00\00\00\A8\00\00\00\00\00\00\00\08\00\00\00\00\00\00\00\01\00\00\00\05\00\00\00@\04\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\C0\02\00\00\00\00\00\00\C0\02\00\00\00\00\00\00\08\00\00\00\00\00\00\00\01\00\00\00\05\00\00\00\00\0A\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\A8\00\00\00\00\00\00\00\A8\00\00\00\00\00\00\00\08\00\00\00\00\00\00\00\01\00\01\01P\00\00\00\88\01\00\00\00\00\00\00\87\01\00\00@\00\00\00\03\00\06\00K\00\00\00\00\00\00\00\00\00\00\00\11 \00\00\00\00\00\00\00\00\00\00\00\00\00\00{\02\00\00\00\00\00\00H\00\00\00\00\00\00\00\00\00\00\00\00\00\00\000\0A//\03\00\F3\1E\0A.version 6.3\0A.target sm_75\0A.address_size 64\0A1\00\F8\17isible .entry main_kernel(\0A.param .u64\19\00\11_\17\005_0,!\00?f32!\00\00/1,B\00\0C\F3\192\0A)\0A.maxntid 10, 1, 1\0A{\0A.reg .b32 %r<2>;\11\00\00f\00E%f<4\11\00\F2\00b64 %rd<8>;\0A\0Aldm\00\22.u\16\00N1, [s\00=0];*\00\1F2*\00\02\F4\032];\0Acvta.to.global0\00!3,6\00\07I\00\02\9A\00\0Fr\00\03\1F1H\00\06\114H\00\801;\0Amov.uC\00\F1\07r1, %tid.x;\0Amul.wide.s\1A\002d5, \00\824;\0Aadd.sD\00&6,J\00\115\92\00\03d\00\02\93\00\00\DB\00\00&\00\12]5\00#rn\18\00\223,\1D\009%f1O\00&7,\E1\00X5;\0AstO\00\00J\00 7]5\00\C03;\0Aret;\0A\0A}\0A\00\00", align 8
@main_kernel_main_kernel_kernel_name = private unnamed_addr constant [12 x i8] c"main_kernel\00", align 1

define void @main(ptr %0, ptr %1) {
  %3 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } undef, ptr %0, 0
  %4 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %3, ptr %0, 1
  %5 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %4, i64 0, 2
  %6 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %5, i64 10, 3, 0
  %7 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %6, i64 1, 4, 0
  %8 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } undef, ptr %1, 0
  %9 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %8, ptr %1, 1
  %10 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %9, i64 0, 2
  %11 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %10, i64 10, 3, 0
  %12 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %11, i64 1, 4, 0
  %13 = call ptr @mgpuMemAlloc(i64 ptrtoint (ptr getelementptr (float, ptr null, i64 10) to i64), ptr null, i8 1)
  %14 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } undef, ptr %13, 0
  %15 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %14, ptr %13, 1
  %16 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %15, i64 0, 2
  %17 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %16, i64 10, 3, 0
  %18 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %17, i64 1, 4, 0
  %19 = call ptr @mgpuMemAlloc(i64 ptrtoint (ptr getelementptr (float, ptr null, i64 10) to i64), ptr null, i8 1)
  %20 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } undef, ptr %19, 0
  %21 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %20, ptr %19, 1
  %22 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %21, i64 0, 2
  %23 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %22, i64 10, 3, 0
  %24 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %23, i64 1, 4, 0
  %25 = call ptr @mgpuStreamCreate()
  %26 = extractvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %7, 1
  %27 = extractvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %18, 1
  call void @mgpuMemcpy(ptr %27, ptr %26, i64 ptrtoint (ptr getelementptr (float, ptr null, i64 10) to i64), ptr %25)
  call void @mgpuStreamSynchronize(ptr %25)
  call void @mgpuStreamDestroy(ptr %25)
  %28 = extractvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %18, 1
  %29 = extractvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %24, 1
  %30 = alloca %0, align 8
  %31 = alloca ptr, i64 3, align 8
  %32 = getelementptr inbounds %0, ptr %30, i32 0, i32 0
  store ptr %28, ptr %32, align 8
  %33 = getelementptr ptr, ptr %31, i32 0
  store ptr %32, ptr %33, align 8
  %34 = getelementptr inbounds %0, ptr %30, i32 0, i32 1
  store float 1.000000e+01, ptr %34, align 4
  %35 = getelementptr ptr, ptr %31, i32 1
  store ptr %34, ptr %35, align 8
  %36 = getelementptr inbounds %0, ptr %30, i32 0, i32 2
  store ptr %29, ptr %36, align 8
  %37 = getelementptr ptr, ptr %31, i32 2
  store ptr %36, ptr %37, align 8
  %38 = call ptr @mgpuModuleLoad(ptr @main_kernel_bin_cst, i64 3280)
  %39 = call ptr @mgpuModuleGetFunction(ptr %38, ptr @main_kernel_main_kernel_kernel_name)
  %40 = call ptr @mgpuStreamCreate()
  call void @mgpuLaunchKernel(ptr %39, i64 1, i64 1, i64 1, i64 10, i64 1, i64 1, i32 0, ptr %40, ptr %31, ptr null, i64 3)
  call void @mgpuStreamSynchronize(ptr %40)
  call void @mgpuStreamDestroy(ptr %40)
  call void @mgpuModuleUnload(ptr %38)
  %41 = call ptr @mgpuStreamCreate()
  %42 = extractvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %24, 1
  %43 = extractvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %12, 1
  call void @mgpuMemcpy(ptr %43, ptr %42, i64 ptrtoint (ptr getelementptr (float, ptr null, i64 10) to i64), ptr %41)
  call void @mgpuStreamSynchronize(ptr %41)
  call void @mgpuStreamDestroy(ptr %41)
  ret void
}

declare ptr @mgpuMemAlloc(i64, ptr, i8)

declare ptr @mgpuStreamCreate()

declare void @mgpuMemcpy(ptr, ptr, i64, ptr)

declare void @mgpuStreamSynchronize(ptr)

declare void @mgpuStreamDestroy(ptr)

declare ptr @mgpuModuleLoad(ptr, i64)

declare ptr @mgpuModuleGetFunction(ptr, ptr)

declare void @mgpuLaunchKernel(ptr, i64, i64, i64, i64, i64, i64, i32, ptr, ptr, ptr, i64)

declare void @mgpuModuleUnload(ptr)

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
