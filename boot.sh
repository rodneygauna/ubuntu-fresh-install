#!/bin/bash

# Enable strict error handling
set -e

# Populate ASCII art from the ascii.sh script
ascii_art=$(bash ascii.sh)

# Print the ASCII art
echo -e "$ascii_art"
# Print the warning message
echo "=> This script is for fresh Ubuntu 24.04+ installations only."
echo -e "\nBegin installation (or abort with CTRL+C)..."

# Update package lists
sudo apt update >/dev/null

# Install Git
sudo apt install git -y >/dev/null

# Clone the repository
echo "Cloning the repository..."
# Remove the previous clone if it exists
rm -rf ~/.local/share/ubuntu-fresh-install
# Start the cloning of the repository
git clone https://github.com/rodneygauna/ubuntu-fresh-install.git ~/.local/share/ubuntu-fresh-install >/dev/null

# Run the installation script
echo "Installation starting..."
source ~/.local/share/ubuntu-fresh-install/install.sh