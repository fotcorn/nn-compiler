#ifndef TOYNPU_DIALECT
#define TOYNPU_DIALECT

include "mlir/IR/OpBase.td"

def ToyNPU_Dialect : Dialect {
    let name = "toynpu";
    let summary = "Dialect for ToyNPU instructions";
    let description = "A dialect for ToyNPU";
    let useDefaultAttributePrinterParser = 1;
    let useDefaultTypePrinterParser = 1;
}


class ToyNPU_Op<string mnemonic, list<Trait> traits = []> :
        Op<ToyNPU_Dialect, mnemonic, traits>;

#endif // TOYNPU_DIALECT
