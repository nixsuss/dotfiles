#!/bin/bash
set -eu
sudo sed -i '/^\#\[multilib\]/s/^#//' /etc/pacman.conf
sudo sed -i '/^\[multilib\]/ {n; s/^#//}' /etc/pacman.conf
sudo pacman -Syy
sudo pacman -S --needed --noconfirm gamemode lib32-gamemode wine-staging winetricks wine-mono lib32-freetype2 gamescope gst-plugins-bad gst-plugins-good gst-plugins-ugly gst-plugins-base lib32-gst-plugins-base lib32-gst-plugins-good gst-libav lib32-mangohud mangohud lib32-nvidia-utils gstreamer zenity goverlay lib32-gstreamer
