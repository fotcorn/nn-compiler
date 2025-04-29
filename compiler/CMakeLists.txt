cmake_minimum_required(VERSION 3.15)

project(SimpleMLIRCompiler CXX C)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Load MLIR and LLVM
find_package(MLIR REQUIRED CONFIG)
find_package(LLVM REQUIRED CONFIG)

list(APPEND CMAKE_MODULE_PATH "${MLIR_CMAKE_DIR}")
list(APPEND CMAKE_MODULE_PATH "${LLVM_CMAKE_DIR}")

include(TableGen)
include(AddLLVM)
include(AddMLIR)
include(HandleLLVMOptions)

get_property(dialect_libs GLOBAL PROPERTY MLIR_DIALECT_LIBS)
get_property(conversion_libs GLOBAL PROPERTY MLIR_CONVERSION_LIBS)
set(LIBS
        ${dialect_libs}
        ${conversion_libs}
        MLIRArithDialect
        MLIROptLib
        )

include_directories(${LLVM_INCLUDE_DIRS})
include_directories(${MLIR_INCLUDE_DIRS})
include_directories(include)

# Add simple-compiler executable
add_llvm_executable(toynpu-opt
    lib/Tools/toynpu-opt.cpp
    lib/Transforms/TransposeFolder.cpp
    lib/Transforms/TransposeFolderPass.cpp
)
llvm_update_compile_flags(toynpu-opt)
target_link_libraries(toynpu-opt PRIVATE ${LIBS})
mlir_check_all_link_libraries(toynpu-opt)
