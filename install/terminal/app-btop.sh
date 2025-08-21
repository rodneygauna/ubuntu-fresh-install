#!/bin/bash

# This script installs btop, a resource monitor that shows usage and stats for processor, memory, disks, network and processes.
sudo apt install -y btop

# Use Ubuntu Fresh Install btop config
mkdir -p ~/.config/btop/themes
cp ~/.local/share/ubuntu-fresh-install/configs/btop.conf ~/.config/btop/btop.conf
cp ~/.local/share/ubuntu-fresh-install/themes/tokyo-night/btop.theme ~/.config/btop/themes/tokyo-night.theme
