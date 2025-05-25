#!/bin/bash
set -eu
sudo timedatectl set-ntp true
sudo pacman -Syyu
sudo pacman -S --noconfirm archlinux-keyring
sudo pacman -S --needed xorg-server xorg-xrdb xorg-xrandr xorg-xprop xorg-setxkbmap xorg-xinit xorg-server-devel nvidia nvidia-utils pipewire pipewire-pulse pipewire-alsa alsa-utils wireplumber pipewire-jack ttf-dejavu ttf-cascadia-code ttf-fira-code noto-fonts-extra noto-fonts-emoji ttf-hack gvim xdg-utils scrot rxvt-unicode wget git slock nitrogen picom zathura-pdf-mupdf zathura mpv neofetch gparted gnome-disk-utility pcmanfm engrampa leafpad dconf-editor galculator papirus-icon-theme ntfs-3g mtpfs gvfs-mtp gvfs-gphoto2 gvfs rsync htop mpc qbittorrent ncmpcpp zsh zsh-completions mpd qt5ct qt6ct kvantum ufw nwg-look base-devel pavucontrol breeze-icons capitaine-cursors polkit-gnome smartmontools xss-lock rofi torbrowser-launcher torsocks numlockx clipmenu lsd redshift nsxiv xclip figlet lolcat libx11 libxinerama libxft capitaine-cursors curl dialog mtools ttf-scheherazade-new bottom dust yt-dlp bat ffmpeg conky fribidi kitty lf trash-cli terminus-font pfetch ffnvcodec-headers pywal xdotool sound-theme-freedesktop zsh-autosuggestions syntax-highlighting dunst
sudo systemctl enable fstrim.timer
sudo systemctl enable ufw 
sudo ufw enable
sudo systemctl enable tor
sudo grub-mkconfig -o /boot/grub/grub.cfg
sudo mv -iv Fonts/* /usr/share/fonts/
rm -rfv Fonts
sudo cp figlet/* /usr/share/figlet/fonts/
rm -rf figlet
mkdir -pv Pictures/{screenshots,wallpaper}
mkdir -pv .cache/mpd
mkdir -pv Documents
mkdir -pv Music
mkdir -pv Videos
mkdir -pv .icons/default
mkdir -pv .themes
fc-cache -rv
chsh -s /bin/zsh
reboot
