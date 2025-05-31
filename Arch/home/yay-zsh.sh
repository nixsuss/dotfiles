#!/bin/bash
set -eu
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd
yay -Syyu
yay -S ttf-amiri ttf-sil-lateef ttf-arabeyes-fonts librewolf-bin ttf-cairo ttf-ubuntu-arabic
fc-cache -rv
