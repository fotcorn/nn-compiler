; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

%0 = type { ptr, ptr, i64, i64, i64, float, ptr, ptr, i64, i64, i64 }

@main_kernel_bin_cst = internal constant [3448 x i8] c"P\EDU\BA\01\00\10\00h\0D\00\00\00\00\00\00\02\00\01\01@\00\00\00(\0B\00\00\00\00\00\00\00\00\00\00\00\00\00\00\07\00\01\00K\00\00\00\00\00\00\00\00\00\00\00\11\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\7FELF\02\01\013\07\00\00\00\00\00\00\00\02\00\BE\00~\00\00\00\00\00\00\00\00\00\00\00\80\0A\00\00\00\00\00\00\80\07\00\00\00\00\00\00K\05K\00@\008\00\03\00@\00\0C\00\01\00\00.shstrtab\00.strtab\00.symtab\00.symtab_shndx\00.nv.info\00.text.main_kernel\00.nv.info.main_kernel\00.nv.shared.main_kernel\00.nv.constant0.main_kernel\00.rel.nv.constant0.main_kernel\00.debug_frame\00.rel.debug_frame\00.rela.debug_frame\00.nv.callgraph\00.nv.prototype\00.nv.rel.action\00\00.shstrtab\00.strtab\00.symtab\00.symtab_shndx\00.nv.info\00.text.main_kernel\00.nv.info.main_kernel\00.nv.shared.main_kernel\00.rel.nv.constant0.main_kernel\00.nv.constant0.main_kernel\00.debug_frame\00.rel.debug_frame\00.rela.debug_frame\00.nv.callgraph\00.nv.prototype\00.nv.rel.action\00main_kernel\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\002\00\00\00\03\00\0B\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\8E\00\00\00\03\00\0A\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\A8\00\00\00\03\00\04\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\D8\00\00\00\03\00\07\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\F4\00\00\00\03\00\08\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\03\01\00\00\12\10\0B\00\00\00\00\00\00\00\00\00\00\01\00\00\00\00\00\00\FF\FF\FF\FF$\00\00\00\00\00\00\00\FF\FF\FF\FF\FF\FF\FF\FF\03\00\04|\FF\FF\FF\FF\0F\0C\81\80\80(\00\08\FF\81\80(\08\81\80\80(\00\00\00\FF\FF\FF\FF4\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\00\00\00\04\04\00\00\00\04 \00\00\00\0C\81\80\80(\00\04\FC\FF\FF?\00\00\00\00\00\00\00\04/\08\00\06\00\00\00\0A\00\00\00\04\11\08\00\06\00\00\00\00\00\00\00\04\12\08\00\06\00\00\00\00\00\00\00\046\04\00\01\00\00\00\047\04\00~\00\00\00\04\0A\08\00\02\00\00\00`\01X\00\03\19X\00\04\17\0C\00\00\00\00\00\0A\00P\00\00\F0!\00\04\17\0C\00\00\00\00\00\09\00H\00\00\F0!\00\04\17\0C\00\00\00\00\00\08\00@\00\00\F0!\00\04\17\0C\00\00\00\00\00\07\008\00\00\F0!\00\04\17\0C\00\00\00\00\00\06\000\00\00\F0!\00\04\17\0C\00\00\00\00\00\05\00(\00\00\F0\11\00\04\17\0C\00\00\00\00\00\04\00 \00\00\F0!\00\04\17\0C\00\00\00\00\00\03\00\18\00\00\F0!\00\04\17\0C\00\00\00\00\00\02\00\10\00\00\F0!\00\04\17\0C\00\00\00\00\00\01\00\08\00\00\F0!\00\04\17\0C\00\00\00\00\00\00\00\00\00\00\F0!\00\03\1B\FF\00\04\1C\04\00\80\00\00\00\04\05\0C\00\0A\00\00\00\01\00\00\00\01\00\00\00\00\00\00\00\FF\FF\FF\FF\00\00\00\00\FE\FF\FF\FF\00\00\00\00\FD\FF\FF\FF\00\00\00\00\FC\FF\FF\FFs\00\00\00\00\00\00\00\00\00\00\11%\00\056D\00\00\00\00\00\00\00\02\00\00\00\06\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\02z\01\00\00\0A\00\00\00\0F\00\00\00\E4\0F\00\19y\04\00\00\00\00\00\00!\00\00\00\22\0E\00\02x\05\00\04\00\00\00\00\0F\00\00\00\CA\0F\00%v\02\04\00Z\00\00\05\02\8E\07\00\D0\1F\00\81s\02\02\00\00\00\00\00\E9\1E\00\00\A2\0E\00%v\04\04\00f\00\00\05\02\8E\07\00\C8\0F\00!v\07\02\00b\00\00\00\00\00\00\00\D0O\00\86s\00\04\07\00\00\00\00\E9\10\00\00\E2\0F\00My\00\00\00\00\00\00\00\00\80\03\00\EA\0F\00Gy\00\00\F0\FF\FF\FF\FF\FF\83\03\00\C0\0F\00\18y\00\00\00\00\00\00\00\00\00\00\00\C0\0F\00\18y\00\00\00\00\00\00\00\00\00\00\00\C0\0F\00\18y\00\00\00\00\00\00\00\00\00\00\00\C0\0F\00\18y\00\00\00\00\00\00\00\00\00\00\00\C0\0F\00\18y\00\00\00\00\00\00\00\00\00\00\00\C0\0F\00\18y\00\00\00\00\00\00\00\00\00\00\00\C0\0F\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\03\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00@\00\00\00\00\00\00\00\03\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\0B\00\00\00\03\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00C\01\00\00\00\00\00\00\0F\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\13\00\00\00\02\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00X\02\00\00\00\00\00\00\A8\00\00\00\00\00\00\00\02\00\00\00\06\00\00\00\08\00\00\00\00\00\00\00\18\00\00\00\00\00\00\00\A8\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\03\00\00\00\00\00\00p\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00)\00\00\00\00\00\00p\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00p\03\00\00\00\00\00\00$\00\00\00\00\00\00\00\03\00\00\00\00\00\00\00\04\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00D\00\00\00\00\00\00p@\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\94\03\00\00\00\00\00\00\EC\00\00\00\00\00\00\00\03\00\00\00\0B\00\00\00\04\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\D8\00\00\00\01\00\00p\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\80\04\00\00\00\00\00\00 \00\00\00\00\00\00\00\03\00\00\00\00\00\00\00\04\00\00\00\00\00\00\00\08\00\00\00\00\00\00\00\F4\00\00\00\0B\00\00p\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\A0\04\00\00\00\00\00\00\10\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\08\00\00\00\00\00\00\00\08\00\00\00\00\00\00\00\B5\00\00\00\09\00\00\00@\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\B0\04\00\00\00\00\00\00\10\00\00\00\00\00\00\00\03\00\00\00\04\00\00\00\08\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00p\00\00\00\01\00\00\00B\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\C0\04\00\00\00\00\00\00\B8\01\00\00\00\00\00\00\00\00\00\00\0B\00\00\00\04\00\00\00\00\00\00\00\00\00\00\00\00\00\00\002\00\00\00\01\00\00\00\06\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\80\06\00\00\00\00\00\00\00\01\00\00\00\00\00\00\03\00\00\00\06\00\00\0A\80\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\06\00\00\00\05\00\00\00\80\0A\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\A8\00\00\00\00\00\00\00\A8\00\00\00\00\00\00\00\08\00\00\00\00\00\00\00\01\00\00\00\05\00\00\00\C0\04\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\C0\02\00\00\00\00\00\00\C0\02\00\00\00\00\00\00\08\00\00\00\00\00\00\00\01\00\00\00\05\00\00\00\80\0A\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\A8\00\00\00\00\00\00\00\A8\00\00\00\00\00\00\00\08\00\00\00\00\00\00\00\01\00\01\01P\00\00\00\B0\01\00\00\00\00\00\00\AF\01\00\00@\00\00\00\03\00\06\00K\00\00\00\00\00\00\00\00\00\00\00\11 \00\00\00\00\00\00\00\00\00\00\00\00\00\00\84\03\00\00\00\00\00\00H\00\00\00\00\00\00\00\00\00\00\00\00\00\00\000\0A//\03\00\F3\1E\0A.version 6.3\0A.target sm_75\0A.address_size 64\0A1\00\F8\17isible .entry main_kernel(\0A.param .u64\19\00\11_\17\00?_0,!\00\0C\1F1!\00\0D\1F2!\00\0D\1F3!\00\0D\164!\00?f32!\00\00\1F5B\00\0D\1F6!\00\0D\1F7!\00\0D\1F8!\00\0D\1F9!\00\0D\F3\1A10\0A)\0A.maxntid 10, 1, 1\0A{\0A.reg .b32 %r<2>;\11\00\00\EB\00E%f<4\11\00\F2\00b64 %rd<8>;\0A\0Aldn\00\22.u\16\00N1, [t\00\F4\037];\0Acvta.to.global0\00!2,6\00\1D;I\00\1F3I\00\02\1F1I\00\06\114I\00\813;\0Amov.u\C5\00\F1\061, %tid.x;\0Amul.wide.s\1A\002d5, \00\824;\0Aadd.sD\00&6,J\00\175\93\00\02\03\01\0F\DB\00\03!5])\00\03\8D\00\02*\00@2, [O\00\12]^\00#rn\18\00\223,\1D\009%f1x\00&7,\0B\01X5;\0AstO\00\00J\00 7]5\00\C03;\0Aret;\0A\0A}\0A\00\00", align 8
@main_kernel_main_kernel_kernel_name = private unnamed_addr constant [12 x i8] c"main_kernel\00", align 1

define void @main(ptr %0, ptr %1, i64 %2, i64 %3, i64 %4, ptr %5, ptr %6, i64 %7, i64 %8, i64 %9) {
  %11 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } undef, ptr %0, 0
  %12 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %11, ptr %1, 1
  %13 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %12, i64 %2, 2
  %14 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %13, i64 %3, 3, 0
  %15 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %14, i64 %4, 4, 0
  %16 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } undef, ptr %5, 0
  %17 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %16, ptr %6, 1
  %18 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %17, i64 %7, 2
  %19 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %18, i64 %8, 3, 0
  %20 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %19, i64 %9, 4, 0
  %21 = call ptr @mgpuMemAlloc(i64 ptrtoint (ptr getelementptr (float, ptr null, i64 10) to i64), ptr null, i8 1)
  %22 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } undef, ptr %21, 0
  %23 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %22, ptr %21, 1
  %24 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %23, i64 0, 2
  %25 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %24, i64 10, 3, 0
  %26 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %25, i64 1, 4, 0
  %27 = call ptr @mgpuMemAlloc(i64 ptrtoint (ptr getelementptr (float, ptr null, i64 10) to i64), ptr null, i8 1)
  %28 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } undef, ptr %27, 0
  %29 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %28, ptr %27, 1
  %30 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %29, i64 0, 2
  %31 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %30, i64 10, 3, 0
  %32 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %31, i64 1, 4, 0
  %33 = call ptr @mgpuStreamCreate()
  %34 = extractvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %15, 1
  %35 = extractvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %26, 1
  call void @mgpuMemcpy(ptr %35, ptr %34, i64 ptrtoint (ptr getelementptr (float, ptr null, i64 10) to i64), ptr %33)
  call void @mgpuStreamSynchronize(ptr %33)
  call void @mgpuStreamDestroy(ptr %33)
  %36 = extractvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %26, 0
  %37 = extractvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %26, 1
  %38 = extractvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %26, 2
  %39 = extractvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %26, 3, 0
  %40 = extractvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %26, 4, 0
  %41 = extractvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %32, 0
  %42 = extractvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %32, 1
  %43 = extractvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %32, 2
  %44 = extractvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %32, 3, 0
  %45 = extractvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %32, 4, 0
  %46 = alloca %0, align 8
  %47 = alloca ptr, i64 11, align 8
  %48 = getelementptr inbounds %0, ptr %46, i32 0, i32 0
  store ptr %36, ptr %48, align 8
  %49 = getelementptr ptr, ptr %47, i32 0
  store ptr %48, ptr %49, align 8
  %50 = getelementptr inbounds %0, ptr %46, i32 0, i32 1
  store ptr %37, ptr %50, align 8
  %51 = getelementptr ptr, ptr %47, i32 1
  store ptr %50, ptr %51, align 8
  %52 = getelementptr inbounds %0, ptr %46, i32 0, i32 2
  store i64 %38, ptr %52, align 4
  %53 = getelementptr ptr, ptr %47, i32 2
  store ptr %52, ptr %53, align 8
  %54 = getelementptr inbounds %0, ptr %46, i32 0, i32 3
  store i64 %39, ptr %54, align 4
  %55 = getelementptr ptr, ptr %47, i32 3
  store ptr %54, ptr %55, align 8
  %56 = getelementptr inbounds %0, ptr %46, i32 0, i32 4
  store i64 %40, ptr %56, align 4
  %57 = getelementptr ptr, ptr %47, i32 4
  store ptr %56, ptr %57, align 8
  %58 = getelementptr inbounds %0, ptr %46, i32 0, i32 5
  store float 1.000000e+01, ptr %58, align 4
  %59 = getelementptr ptr, ptr %47, i32 5
  store ptr %58, ptr %59, align 8
  %60 = getelementptr inbounds %0, ptr %46, i32 0, i32 6
  store ptr %41, ptr %60, align 8
  %61 = getelementptr ptr, ptr %47, i32 6
  store ptr %60, ptr %61, align 8
  %62 = getelementptr inbounds %0, ptr %46, i32 0, i32 7
  store ptr %42, ptr %62, align 8
  %63 = getelementptr ptr, ptr %47, i32 7
  store ptr %62, ptr %63, align 8
  %64 = getelementptr inbounds %0, ptr %46, i32 0, i32 8
  store i64 %43, ptr %64, align 4
  %65 = getelementptr ptr, ptr %47, i32 8
  store ptr %64, ptr %65, align 8
  %66 = getelementptr inbounds %0, ptr %46, i32 0, i32 9
  store i64 %44, ptr %66, align 4
  %67 = getelementptr ptr, ptr %47, i32 9
  store ptr %66, ptr %67, align 8
  %68 = getelementptr inbounds %0, ptr %46, i32 0, i32 10
  store i64 %45, ptr %68, align 4
  %69 = getelementptr ptr, ptr %47, i32 10
  store ptr %68, ptr %69, align 8
  %70 = call ptr @mgpuModuleLoad(ptr @main_kernel_bin_cst, i64 3448)
  %71 = call ptr @mgpuModuleGetFunction(ptr %70, ptr @main_kernel_main_kernel_kernel_name)
  %72 = call ptr @mgpuStreamCreate()
  call void @mgpuLaunchKernel(ptr %71, i64 1, i64 1, i64 1, i64 10, i64 1, i64 1, i32 0, ptr %72, ptr %47, ptr null, i64 11)
  call void @mgpuStreamSynchronize(ptr %72)
  call void @mgpuStreamDestroy(ptr %72)
  call void @mgpuModuleUnload(ptr %70)
  %73 = call ptr @mgpuStreamCreate()
  %74 = extractvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %32, 1
  %75 = extractvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %20, 1
  call void @mgpuMemcpy(ptr %75, ptr %74, i64 ptrtoint (ptr getelementptr (float, ptr null, i64 10) to i64), ptr %73)
  call void @mgpuStreamSynchronize(ptr %73)
  call void @mgpuStreamDestroy(ptr %73)
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
