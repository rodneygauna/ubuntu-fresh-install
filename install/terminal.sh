#!/bin/bash

# Needed for all installers
sudo apt update -y
sudo apt upgrade -y
sudo apt install -y curl git unzip

# Install common development libraries needed for language installations
sudo apt install -y build-essential libssl-dev libreadline-dev zlib1g-dev \
  libbz2-dev libsqlite3-dev libffi-dev liblzma-dev libncurses5-dev \
  libxml2-dev libxmlsec1-dev libyaml-dev

# Run terminal installers
for installer in ~/.local/share/ubuntu-fresh-install/install/terminal/*.sh; do source $installer; done