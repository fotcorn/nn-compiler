import torch
import torch.nn as nn
import torch.optim as optim
from torchvision import datasets, transforms
from torch.utils.data import DataLoader
from model import SimpleNet

# Set device
device = torch.device("cuda" if torch.cuda.is_available() else "cpu")

def train(model, train_loader, criterion, optimizer, device):
    model.train()
    for batch_idx, (data, target) in enumerate(train_loader):
        data, target = data.to(device), target.to(device)

        optimizer.zero_grad()
        output = model(data)
        loss = criterion(output, target)
        loss.backward()
        optimizer.step()

        if batch_idx % 100 == 0:
            print(f'Batch {batch_idx}/{len(train_loader)}, Loss: {loss.item():.4f}')

def validate(model, test_loader, device):
    model.eval()
    correct = 0
    total = 0
    with torch.no_grad():
        for data, target in test_loader:
            data, target = data.to(device), target.to(device)
            output = model(data)
            _, predicted = torch.max(output.data, 1)
            total += target.size(0)
            correct += (predicted == target).sum().item()

    accuracy = 100 * correct / total
    print(f'Validation Accuracy: {accuracy:.2f}%')
    return accuracy

def main():
    # Hyperparameters
    batch_size = 64
    learning_rate = 0.001
    epochs = 5

    # Load MNIST dataset
    transform = transforms.Compose([
        transforms.ToTensor(),
        transforms.Normalize((0.1307,), (0.3081,))
    ])

    train_dataset = datasets.MNIST('./data', train=True, download=True, transform=transform)
    test_dataset = datasets.MNIST('./data', train=False, transform=transform)

    train_loader = DataLoader(train_dataset, batch_size=batch_size, shuffle=True)
    test_loader = DataLoader(test_dataset, batch_size=batch_size, shuffle=False)

    # Initialize model, criterion, and optimizer
    model = SimpleNet().to(device)
    criterion = nn.CrossEntropyLoss()
    optimizer = optim.Adam(model.parameters(), lr=learning_rate)

    # Compile model after initializing optimizer
    model = torch.compile(model)

    # Training loop
    print("Starting training...")
    best_accuracy = 0
    for epoch in range(epochs):
        print(f"\nEpoch {epoch+1}/{epochs}")
        train(model, train_loader, criterion, optimizer, device)
        accuracy = validate(model, test_loader, device)

        if accuracy > best_accuracy:
            best_accuracy = accuracy
            torch.save({
                'model_state_dict': model._orig_mod.state_dict(),
                'optimizer_state_dict': optimizer.state_dict(),
                'accuracy': accuracy,
                'epoch': epoch
            }, 'best_model.pth')

    print(f"Training completed. Best accuracy: {best_accuracy:.2f}%")

if __name__ == "__main__":
    main()
