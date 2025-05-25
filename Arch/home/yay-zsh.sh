#!/bin/bash
set -eu
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd
yay -Syyu
yay -S ttf-amiri ttf-sil-scheherazade ttf-sil-lateef ttf-arabeyes-fonts nerd-fonts-git