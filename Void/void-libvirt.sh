#!/bin/bash
set -eu
sudo xbps-install -Sy qemu virt-manager virt-viewer dnsmasq vde2 bridge-utils openbsd-netcat
sudo ln -sv /etc/sv/{libvirtd,virtlogd,virtlockd} /var/service/
sudo usermod -aG libvirt $USER
