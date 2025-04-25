#include <mlir/IR/MLIRContext.h>
#include <mlir/IR/Builders.h>
#include <mlir/IR/BuiltinOps.h>
#include <mlir/IR/Verifier.h>
#include <mlir/Dialect/Func/IR/FuncOps.h>
#include <mlir/Dialect/Arith/IR/Arith.h>


int main() {
    mlir::MLIRContext context;

    // Load the dialects we will be using
    context.loadDialect<mlir::func::FuncDialect>();
    context.loadDialect<mlir::arith::ArithDialect>();

    // Create a builder and a location
    mlir::OpBuilder builder(&context);
    mlir::Location unknownLoc = builder.getUnknownLoc();

    // Create a module
    auto module = mlir::ModuleOp::create(unknownLoc);

    // Define the function type: (i32, i32) -> i32
    auto integerType = builder.getI32Type();
    auto funcType = builder.getFunctionType({integerType, integerType}, integerType);

    // Create the function 'add'
    auto funcOp = mlir::func::FuncOp::create(unknownLoc, "add", funcType);
    module.push_back(funcOp);

    // Create the entry block
    mlir::Block *entryBlock = funcOp.addEntryBlock();
    builder.setInsertionPointToStart(entryBlock);

    // Get the function arguments
    mlir::Value arg0 = entryBlock->getArgument(0);
    mlir::Value arg1 = entryBlock->getArgument(1);

    // Create the arith.addi operation
    mlir::Value sum = builder.create<mlir::arith::AddIOp>(unknownLoc, arg0, arg1);

    // Create the return operation
    builder.create<mlir::func::ReturnOp>(unknownLoc, sum);

    // Verify the module
    if (mlir::failed(mlir::verify(module))) {
        module.emitError("Module verification failed");
        return 1;
    }

    // Dump the module to standard output
    module.dump();

    return 0;
}
