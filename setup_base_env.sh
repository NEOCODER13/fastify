#!/bin/bash

# Update and upgrade the system
echo "Updating and upgrading system..."
sudo apt update && sudo apt upgrade -y

# Install essential packages
echo "Installing essential packages..."
sudo apt install -y build-essential git curl wget unzip software-properties-common

# Install Python and pip
echo "Installing Python and pip..."
sudo apt install -y python3 python3-pip python3-venv
pip3 install --upgrade pip

# Install virtualenv for project isolation
echo "Installing virtualenv..."
pip3 install virtualenv

# Install Jupyter Notebook
echo "Installing Jupyter Notebook..."
pip3 install notebook

# Install AI frameworks
echo "Installing TensorFlow..."
pip3 install tensorflow
echo "Installing PyTorch..."
pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu

# Install Docker
echo "Installing Docker..."
sudo apt install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker
# Add current user to the docker group (requires logout and login)
sudo usermod -aG docker $USER

# Install GitHub CLI
echo "Installing GitHub CLI..."
type -p curl >/dev/null || sudo apt install curl -y
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /usr/share/keyrings/githubcli-archive-keyring.gpg > /dev/null
sudo apt-add-repository https://cli.github.com/packages
sudo apt update
sudo apt install gh -y

# Install Node.js and npm (useful for some AI tools and web development)
echo "Installing Node.js and npm..."
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt install -y nodejs

# Install VS Code (optional)
echo "Installing Visual Studio Code..."
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt update
sudo apt install -y code
rm packages.microsoft.gpg

# Clean up
echo "Cleaning up..."
sudo apt autoremove -y

# Print completion message
echo "AI Developer Environment setup complete!"
echo "Log out and back in for Docker group changes to take effect."
