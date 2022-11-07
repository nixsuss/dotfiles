#!/bin/bash
set -eu
sudo timedatectl set-ntp true
sudo pacman -Syyu
sudo pacman -S --noconfirm archlinux-keyring
sudo pacman -S --needed xorg nvidia nvidia-utils pipewire pipewire-pulse pipewire-alsa alsa-utils wireplumber pipewire-jacknvidia-settings ttf-dejavu ttf-cascadia-code ttf-fira-code noto-fonts-extra noto-fonts-emoji ttf-hack gvim firefox firefox-i18n-en-US firefox-i18n-ar xdg-utils scrot rxvt-unicode dmenu wget git slock nitrogen picom zathura-pdf-mupdf zathura mupdf mpv neofetch gparted gnome-disk-utility pcmanfm file-roller leafpad dconf-editor galculator papirus-icon-theme ntfs-3g mtpfs gvfs-mtp gvfs-gphoto2 gvfs rsync htop mpc qbittorrent ncmpcpp zsh zsh-completions ranger ueberzug vlc mpd qt5ct qt6ct kvantum powerline-fonts ufw nomacs lxappearance-gtk3 base-devel xorg-xinit pavucontrol breeze-icons capitaine-cursors polkit-gnome smartmontools xss-lock rofi torbrowser-launcher torsocks numlockx clipmenu lsd alacritty redshift
sudo systemctl enable fstrim.timer
sudo systemctl enable ufw 
sudo ufw enable
sudo systemctl enable tor
sudo sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT="loglevel=4 quite/GRUB_CMDLINE_LINUX_DEFAULT="loglevel=4 mitigations=off/' /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg
sudo mv -i ComicMono-Bold.ttf /usr/share/fonts/TTF/
sudo mv -i ComicMono.ttf /usr/share/fonts/TTF/
mkdir -p Pictures/screenshots
mkdir -p .cache/mpd
fc-cache -rv