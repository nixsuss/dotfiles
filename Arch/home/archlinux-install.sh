#!/bin/bash
set -eu
sudo timedatectl set-ntp true
sudo pacman -Syyu --noconfirm
sudo pacman -S --noconfirm archlinux-keyring
sudo pacman -S --needed xorg-server xorg-xrdb xorg-xrandr xorg-xprop xorg-setxkbmap xorg-xinit xorg-server-devel nvidia nvidia-utils pipewire pipewire-pulse pipewire-alsa alsa-utils wireplumber pipewire-jack ttf-dejavu ttf-cascadia-code ttf-fira-code noto-fonts-extra noto-fonts-emoji ttf-hack gvim xdg-utils scrot rxvt-unicode wget git slock nitrogen picom zathura mpv gparted gnome-disk-utility pcmanfm engrampa leafpad dconf-editor galculator papirus-icon-theme ntfs-3g mtpfs gvfs-mtp gvfs-gphoto2 gvfs rsync htop mpc qbittorrent ncmpcpp zsh zsh-completions mpd qt5ct qt6ct kvantum ufw nwg-look base-devel pavucontrol breeze-icons capitaine-cursors polkit-gnome smartmontools xss-lock rofi torbrowser-launcher torsocks numlockx lsd redshift nsxiv xclip figlet lolcat libx11 libxinerama libxft capitaine-cursors curl dialog mtools ttf-scheherazade-new bottom dust yt-dlp bat ffmpeg conky fribidi kitty lf trash-cli terminus-font ffnvcodec-headers python-pywal xdotool sound-theme-freedesktop zsh-autosuggestions zsh-syntax-highlighting dunst ttf-jetbrains-mono-nerd fastfetch nvidia-settings kvantum-qt5 bluez bluez-utils blueman ttf-noto-nerd unrar noto-fonts-cjk
sudo pacman -S --assume-installed dmenu clipmenu --noconfirm
sudo sed -i 's/^#IgnorePkg *=.*/IgnorePkg = dmenu/' /etc/pacman.conf
sudo sed -i '/^#Color/s/^#//' /etc/pacman.conf
sudo sed -i '/^#VerbosePkgLists/s/^#//' /etc/pacman.conf
sudo sed -i '/^Color$/a ILoveCandy' /etc/pacman.conf
echo "FONT=ter-d28b" | sudo tee -a /etc/vconsole.conf
sudo sed -i 's/^MODULES=.*/MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm)/' /etc/mkinitcpio.conf
echo "blacklist nouveau
options nouveau modeset=0" | sudo tee /etc/modprobe.d/nouveau_blacklist.conf
sudo mkinitcpio -P
echo "set number" | sudo tee -a /etc/vimrc
echo "Defaults        pwfeedback" | sudo tee -a /etc/sudoers
sudo systemctl enable fstrim.timer
sudo systemctl enable ufw 
sudo ufw enable
sudo systemctl enable tor
sudo systemctl enable bluetooth
systemctl --user enable pipewire pipewire-pulse wireplumber
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
