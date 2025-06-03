#!/bin/bash
set -eu
sudo pacman -Syy --noconfirm xorg-server xorg-xrdb xorg-xrandr xorg-xprop xorg-setxkbmap xorg-server-devel scrot rxvt-unicode slock nitrogen picom xss-lock rofi numlockx xclip libx11 libxinerama libxft dunst conky xdotool dunst
sudo pacman -S --assume-installed dmenu clipmenu --noconfirm
