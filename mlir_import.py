import torch
from torch_mlir import fx
from model import SimpleNet

model = SimpleNet()

m = fx.export_and_import(model, torch.randn(10, 784), output_type=fx.OutputType.STABLEHLO)
print(m)
