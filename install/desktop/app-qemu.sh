#!/bin/bash

# QEMU/KVM allows you to run VMs for other flavors of Linux or even Windows
# virt-manager provides a GUI for managing virtual machines

# Install QEMU, KVM, and virt-manager
sudo apt install -y qemu-kvm qemu-system qemu-utils python3 python3-pip \
  libvirt-clients libvirt-daemon-system bridge-utils virtinst \
  libvirt-daemon virt-manager

# Enable and start libvirt service
sudo systemctl enable libvirtd.service
sudo systemctl start libvirtd.service

# Start the default network and set it to autostart
sudo virsh net-start default 2>/dev/null || true
sudo virsh net-autostart default

# Add user to required groups for VM management
sudo usermod -aG libvirt ${USER}
sudo usermod -aG libvirt-qemu ${USER}
sudo usermod -aG kvm ${USER}
sudo usermod -aG input ${USER}
sudo usermod -aG disk ${USER}