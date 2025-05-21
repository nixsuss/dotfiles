#!/bin/bash
set -eu
echo repository=https://raw.githubusercontent.com/Makrennel/hyprland-void/repository-x86_64-glibc | sudo tee /etc/xbps.d/hyprland-void.conf
sudo xbps-install -Suy wofi seatd hypridle grim mako hyprpaper hyprlock jq wl-clipboard cliphist foot mpDris2 pqiv hyprland xdg-desktop-portal-hyprland hyprland-qtutils Waybar xorg-server-xwayland swww
sudo sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT="loglevel=4/GRUB_CMDLINE_LINUX_DEFAULT="loglevel=4 nvidia_drm.modeset=1 nvidia_drm.fbdev=1 nvidia.NVreg_PreserveVideoMemoryAllocations=1/' /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg
sudo usermod -aG _seatd $USER
sudo ln -sv /etc/sv/seatd /var/service/
sudo makewhatis -a
cp -rv config/* ~/.config/
cp -rv bin/* ~/.local/bin/
rm -rfv config bin
