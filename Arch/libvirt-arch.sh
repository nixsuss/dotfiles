#!/bin/bash
set -eu
sudo pacman -S --needed --noconfirm qemu virt-manager virt-viewer dnsmasq vde2 bridge-utils openbsd-netcat
sudo systemctl enable libvirtd
sudo usermod -aG libvirt $USER
