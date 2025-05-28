#!/bin/bash
set -eu
sudo sed -i '/^\#\[multilib\]/s/^#//' /etc/pacman.conf
sudo sed -i '/^\#Include = \/etc\/pacman.d\/mirrorlist/s/^#//' /etc/pacman.conf
sudo pacman -Syy
sudo pacman -S --needed gamemode lib32-gamemode wine-staging winetricks wine-mono lib32-freetype2 gamescope gst-plugins-bad gst-plugins-good gst-plugins-ugly gst-plugins-base lib32-gst-plugins-base lib32-gst-plugins-good gst-libav lib32-mangohud mangohud lib32-libva libva-nvidia-driver lib32-nvidia-utils gstreamer zenity goverlay 7zip
