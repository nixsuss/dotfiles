#!/bin/bash
set -euo pipefail
echo "ignorepkg=dmenu" | sudo tee /etc/xbps.d/ignore.conf
sudo xbps-install -Suy
sudo xbps-install -S xorg-minimal xrdb xrandr xprop setxkbmap xorg-server-devel nvidia gvim pipewire alsa-utils alsa-pipewire noto-fonts-ttf noto-fonts-emoji noto-fonts-ttf-extra noto-fonts-cjk dejavu-fonts-ttf elogind polkit polkit-gnome wireplumber libjack-pipewire rxvt-unicode base-devel libX11-devel libXft-devel libXinerama-devel git curl wget nitrogen scrot xdg-utils pcmanfm pavucontrol htop font-firacode breeze-cursors gvfs gvfs-mtp mtpfs gvfs-gphoto2 ntfs-3g dialog mtools smartmontools qt5ct qbittorrent slock xss-lock rsync mpv mpc mpd ncmpcpp zsh zsh-completions dconf-editor galculator-gtk3 ufw gparted gnome-disk-utility papirus-icon-theme breeze-icons kvantum picom amiri-font font-sil-scheherazade font-sil-lateef socklog-void torbrowser-launcher rofi dunst nerd-fonts yaru obfs4proxy numlockx clipmenu qt5-styleplugins xtools zathura-pdf-mupdf redshift nsxiv xclip figlet figlet-fonts lolcat-c bottom dust yt-dlp bat lsd ffmpeg6 conky fribidi-devel kitty lf trash-cli terminus-font unrar nwg-look leafpad nv-codec-headers pywal xdotool sound-theme-freedesktop zsh-autosuggestions zsh-syntax-highlighting engrampa wireless-regdb qt6ct fastfetch tesseract-ocr tesseract-ocr-eng tesseract-ocr-ara font-hack-ttf
sudo mkdir -v /etc/cron.weekly/
echo "#!/bin/sh
fstrim /" | sudo tee -a /etc/cron.weekly/fstrim
echo 'omit_drivers+=" nouveau "' | sudo tee -a /etc/dracut.conf.d/nouveau.conf
echo "blacklist nouveau" | sudo tee -a /etc/modprobe.d/nouveau.conf
echo -e "\n$USER ALL=(ALL) NOPASSWD: /usr/bin/shutdown, /usr/bin/reboot, /usr/bin/poweroff, /usr/bin/halt, /usr/bin/zzz\n\nDefaults        pwfeedback" | sudo tee -a /etc/sudoers
sudo chmod 777 /etc/cron.weekly/fstrim
echo "set number" | sudo tee -a /etc/vimrc.local
sudo ln -sv /etc/sv/{elogind,dbus,polkitd,ufw,socklog-unix,nanoklogd,tor} /var/service/
sudo rm -rfv /var/service/acpid
sudo sed -i 's/#GRUB_GFXMODE=1920x1080x32/GRUB_GFXMODE=1920x1080x32/' /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg
sudo sed -i 's/#FONT="lat9w-16"/FONT="ter-d28b"/' /etc/rc.conf
sudo ufw enable
sudo mkdir -pv /etc/alsa/conf.d
sudo ln -sv /usr/share/alsa/alsa.conf.d/* /etc/alsa/conf.d/
sudo ln -sv /usr/share/fontconfig/conf.avail/70-no-bitmaps.conf /etc/fonts/conf.d/
sudo mkdir -pv /etc/pipewire/pipewire.conf.d
sudo ln -sv /usr/share/examples/wireplumber/10-wireplumber.conf /etc/pipewire/pipewire.conf.d/
sudo mv -iv Fonts/* /usr/share/fonts/
sudo cp -v figlet/* /usr/share/figlet/
rm -rfv figlet
rm -rfv Fonts
mkdir -pv Pictures/{screenshots,wallpaper}
mkdir -pv .cache/mpd
mkdir -pv Documents
mkdir -pv Music
mkdir -pv Videos
mkdir -pv .icons/default
mkdir -pv .themes
fc-cache -rv
sudo makewhatis -a
chsh -s /bin/zsh
sudo reboot
