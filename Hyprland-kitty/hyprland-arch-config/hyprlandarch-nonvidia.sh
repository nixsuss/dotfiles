#!/bin/bash
set -eu
sudo pacman -S --needed --noconfirm wofi hypridle grim mako hyprpaper hyprlock jq wl-clipboard cliphist foot mpd-mpris hyprland xdg-desktop-portal-hyprland hyprland-qtutils waybar swww hyprland-protocols python-pywayland
sudo grub-mkconfig -o /boot/grub/grub.cfg
cp -rv config-nonvidia/* ~/.config/
cp -rv bin/* ~/.local/bin/
rm -rfv config bin
