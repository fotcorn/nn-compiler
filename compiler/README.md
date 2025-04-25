```bash
mkdir build
cd build
cmake .. -GNinja -DCMAKE_BUILD_TYPE=Debug\
    -DCMAKE_EXPORT_COMPILE_COMMANDS=ON\
    -DMLIR_DIR=/usr/lib/llvm-19/lib/cmake/mlir/
mold -run ninja
```
