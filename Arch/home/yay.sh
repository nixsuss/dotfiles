#!/bin/bash
set -eu
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd
yay -Syyu
yay -S ttf-amiri ttf-sil-lateef ttf-arabeyes-fonts librewolf-bin ttf-cairo ttf-ubuntu-arabic ttf-ms-win11-auto thorium-browser-bin
fc-cache -rv
