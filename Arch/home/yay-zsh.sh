#!/bin/bash
set -eu
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd
yay -Syyu
yay -S ttf-amiri ttf-sil-scheherazade ttf-sil-lateef ttf-arabeyes-fonts nerd-fonts-overpass nerd-fonts-jetbrains-mono
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"