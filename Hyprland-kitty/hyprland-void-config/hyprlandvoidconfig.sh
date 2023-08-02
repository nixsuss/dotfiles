#!/bin/bash
set -eu
sudo xbps-install -Sy wofi seatd swaybg grim mako swayidle swaylock jq wl-clipboard cliphist foot mpDris2 pqiv
#sudo sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT="loglevel=4 mitigations=off/GRUB_CMDLINE_LINUX_DEFAULT="loglevel=4 mitigations=off nvidia_drm.modeset=1/' /etc/default/grub
#sudo grub-mkconfig -o /boot/grub/grub.cfg
sudo usermod -aG _seatd $USER
sudo ln -sv /etc/sv/seatd /var/service/
