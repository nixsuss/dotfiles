#!/bin/bash
set -eu
sudo pacman -S --needed --noconfirm wofi hypridle grim mako hyprpaper hyprlock jq wl-clipboard cliphist foot mpd-mpris pqiv hyprland xdg-desktop-portal-hyprland hyprland-qtutils waybar swww hyprland-protocols python-pywayland
sudo sed -i 's|GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet"|GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet nvidia_drm.modeset=1 nvidia_drm.fbdev=1 nvidia.NVreg_PreserveVideoMemoryAllocations=1"|' /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg
cp -rv config/* ~/.config/
cp -rv bin/* ~/.local/bin/
rm -rfv config bin
