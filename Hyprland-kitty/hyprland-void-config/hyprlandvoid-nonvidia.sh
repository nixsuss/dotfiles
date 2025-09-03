#!/bin/bash
set -eu
echo repository=https://raw.githubusercontent.com/Makrennel/hyprland-void/repository-x86_64-glibc | sudo tee /etc/xbps.d/hyprland-void.conf
sudo xbps-install -Suy wofi seatd hypridle grim mako hyprpaper hyprlock jq wl-clipboard cliphist foot mpDris2 hyprland xdg-desktop-portal-hyprland hyprland-qtutils Waybar xorg-server-xwayland swww
sudo usermod -aG _seatd $USER
sudo ln -sv /etc/sv/seatd /var/service/
sudo makewhatis -a
cp -rv config-nonvidia/* ~/.config/
cp -rv bin/* ~/.local/bin/
rm -rfv config bin
