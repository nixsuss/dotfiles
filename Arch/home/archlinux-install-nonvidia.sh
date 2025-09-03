#!/bin/bash
set -eu
sudo timedatectl set-ntp true
sudo pacman -Syyu --noconfirm
sudo pacman -S --noconfirm archlinux-keyring
sudo pacman -S --needed pipewire pipewire-pulse pipewire-alsa alsa-utils wireplumber pipewire-jack ttf-dejavu ttf-cascadia-code ttf-fira-code noto-fonts noto-fonts-extra noto-fonts-emoji ttf-hack gvim xdg-utils git zathura mpv gparted gnome-disk-utility pcmanfm-gtk3 engrampa leafpad dconf-editor galculator papirus-icon-theme ntfs-3g mtpfs gvfs-mtp gvfs-gphoto2 gvfs rsync htop mpc qbittorrent ncmpcpp zsh zsh-completions mpd qt5ct qt6ct kvantum ufw nwg-look base-devel pavucontrol breeze-icons polkit-gnome smartmontools torbrowser-launcher torsocks lsd redshift nsxiv figlet lolcat curl dialog mtools ttf-scheherazade-new bottom dust yt-dlp bat ffmpeg fribidi kitty lf trash-cli terminus-font ffnvcodec-headers sound-theme-freedesktop zsh-autosuggestions zsh-syntax-highlighting ttf-jetbrains-mono-nerd fastfetch kvantum-qt5 ttf-noto-nerd unrar noto-fonts-cjk zathura-pdf-mupdf tesseract tesseract-data-eng tesseract-data-ara wireless-regdb linux-headers sof-firmware ttf-ubuntu-font-family python-pywal xorg-xinit cmatrix cava 7zip ttf-nerd-fonts-symbols-mono poppler ghostscript transmission-cli vifm ffmpegthumbnailer rmpc os-prober
sudo sed -i 's/^#IgnorePkg *=.*/IgnorePkg = dmenu/' /etc/pacman.conf
sudo sed -i '/^#Color/s/^#//' /etc/pacman.conf
sudo sed -i '/^#VerbosePkgLists/s/^#//' /etc/pacman.conf
sudo sed -i '/^Color$/a ILoveCandy' /etc/pacman.conf
echo "FONT=ter-d28b" | sudo tee -a /etc/vconsole.conf
sudo mkinitcpio -P
sudo sed -i '/^#GRUB_DISABLE_OS_PROBER=false/s/^#//' /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg
echo "set number
set relativenumber" | sudo tee -a /etc/vimrc
echo "Defaults        pwfeedback" | sudo tee -a /etc/sudoers
sudo systemctl enable fstrim.timer
sudo systemctl enable ufw 
sudo ufw enable
sudo systemctl enable tor
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
