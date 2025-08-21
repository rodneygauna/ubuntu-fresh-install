#!/bin/bash

# Configure the bash shell using Ubuntu Fresh Install defaults
[ -f ~/.bashrc ] && mv ~/.bashrc ~/.bashrc.bak
cp ~/.local/share/ubuntu-fresh-install/configs/bashrc ~/.bashrc

# Load the PATH for use later in the installers
source ~/.local/share/ubuntu-fresh-install/defaults/bash/shell

[ -f ~/.inputrc ] && mv ~/.inputrc ~/.inputrc.bak
# Configure the inputrc using Ubuntu Fresh Install defaults
cp ~/.local/share/ubuntu-fresh-install/configs/inputrc ~/.inputrc