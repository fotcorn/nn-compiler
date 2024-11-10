import torch
from torchvision import datasets, transforms
from torch.utils.data import DataLoader
from model import SimpleNet
import numpy as np

def test_model():
    # Set device
    device = torch.device("cuda" if torch.cuda.is_available() else "cpu")

    # Load the model
    model = SimpleNet().to(device)
    checkpoint = torch.load('best_model.pth', weights_only=True)
    model.load_state_dict(checkpoint['model_state_dict'])
    model = torch.compile(model)
    model.eval()

    # Load test dataset
    transform = transforms.Compose([
        transforms.ToTensor(),
        transforms.Normalize((0.1307,), (0.3081,))
    ])
    test_dataset = datasets.MNIST('./data', train=False, transform=transform)
    test_loader = DataLoader(test_dataset, batch_size=64, shuffle=False)

    # Evaluate the model
    all_preds = []
    all_targets = []
    correct = 0
    total = 0

    with torch.no_grad():
        for data, target in test_loader:
            data, target = data.to(device), target.to(device)
            outputs = model(data)
            _, predicted = torch.max(outputs.data, 1)

            total += target.size(0)
            correct += (predicted == target).sum().item()

            all_preds.extend(predicted.cpu().numpy())
            all_targets.extend(target.cpu().numpy())

    # Calculate and print metrics
    accuracy = 100 * correct / total
    print(f'Test Accuracy: {accuracy:.2f}%')

if __name__ == "__main__":
    test_model()
