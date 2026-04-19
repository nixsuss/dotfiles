#!/bin/sh

set -e

doas pkg update
doas pkg install mate lightdm lightdm-gtk-greeter fusefs-ntfs fuse py311-fastest_pkg Kvantum dust eza fastfetch firefox fzf hack-font libc6-shim libreoffice mpv nerd-fonts-overpass noto qbittorrent qt5ct qt6ct rsync slick-greeter starship strawberry telegram-desktop vim-gtk3 vlc webfonts zsh zsh-autosuggestions zsh-completions zsh-syntax-highlighting qt6gtk2 qt5-style-plugins
doas sysrc kld_list+=fusefs
doas sysrc dbus_enable=YES
doas sysrc lightdm_enable=YES
echo "proc    /proc    procfs    rw    0    0" | doas tee -a /etc/fstab
doas mkdir -p /usr/local/etc/vim/
echo "set number
set relativenumber" | doas tee -a /usr/local/etc/vim/vimrc
chsh -s /usr/local/bin/zsh
