# Add simple-compiler executable
add_llvm_executable(toynpu-opt
    toynpu-opt.cpp
    TransposeFolder.cpp
)

add_dependencies(toynpu-opt ToyNPUPassIncGen)
llvm_update_compile_flags(toynpu-opt)
target_link_libraries(toynpu-opt PRIVATE ${LIBS})
mlir_check_all_link_libraries(toynpu-opt)
