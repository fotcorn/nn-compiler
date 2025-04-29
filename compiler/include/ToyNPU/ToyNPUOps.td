#ifndef TOYNPU_OPS
#define TOYNPU_OPS

def ToyNPU_AddOp : ToyNPU_Op<"add", [Pure,
                                             SameOperandsAndResultType]> {
    let summary = "Add two 32-bit floats.";
    let description = [{
        The `toynpu.add` operation adds two 32-bit floats.
    }];

    let arguments = (ins F32:$input1, F32:$input2);
    let results = (outs F32:$res);

    let assemblyFormat = [{
        $input1 attr-dict `,` $input2 attr-dict
    }];
}

#endif // TOYNPU_OPS
