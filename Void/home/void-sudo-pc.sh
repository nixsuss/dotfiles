#!/bin/bash
set -euo pipefail
sudo mv -iv ignore.conf /etc/xbps.d/
sudo xbps-install -Suy
sudo xbps-install -S xorg xorg-server-devel nvidia gvim pipewire alsa-utils alsa-pipewire noto-fonts-emoji noto-fonts-ttf-extra dejavu-fonts-ttf elogind dbus-elogind dbus-elogind-x11 dbus-elogind-libs polkit polkit-gnome wireplumber libjack-pipewire neofetch rxvt-unicode base-devel libX11-devel libXft-devel libXinerama-devel git curl wget nitrogen scrot xdg-utils pcmanfm file-roller pavucontrol neofetch htop font-firacode breeze-cursors gvfs gvfs-mtp mtpfs gvfs-gphoto2 ntfs-3g dialog mtools smartmontools qt5ct qbittorrent slock xss-lock rsync mpv mpc mpd ncmpcpp zsh zsh-completions dconf-editor galculator-gtk3 ufw gparted gnome-disk-utility papirus-icon-theme breeze-icons kvantum picom amiri-font font-sil-scheherazade font-sil-lateef socklog-void torbrowser-launcher rofi dunst nerd-fonts yaru obfs4proxy numlockx clipmenu qt5-styleplugins xtools zathura-pdf-mupdf redshift sxiv xclip figlet figlet-fonts lolcat-c bottom dust yt-dlp bat lsd ffmpeg conky fribidi-devel kitty lf trash-cli terminus-font p7zip-unrar pfetch nwg-look leafpad nv-codec-headers pywal xdotool sound-theme-freedesktop zsh-autosuggestions zsh-syntax-highlighting
sudo mkdir -v /etc/cron.weekly/
echo "#!/bin/sh
fstrim /" | sudo tee -a /etc/cron.weekly/fstrim
echo 'omit_drivers+=" nouveau "' | sudo tee -a /etc/dracut.conf.d/nouveau.conf
echo "blacklist nouveau" | sudo tee -a /etc/modprobe.d/nouveau.conf
sudo chmod 777 /etc/cron.weekly/fstrim
echo "set number" | sudo tee -a /etc/vimrc.local
sudo ln -sv /etc/sv/{elogind,dbus,polkitd,ufw,socklog-unix,nanoklogd,tor} /var/service/
sudo sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT="loglevel=4/GRUB_CMDLINE_LINUX_DEFAULT="loglevel=4 mitigations=off/' /etc/default/grub
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
rm -rf figlet
mkdir -pv Pictures/{screenshots,wallpaper}
mkdir -pv .cache/mpd
mkdir -pv Documents
mkdir -pv Music
mkdir -pv Videos
fc-cache -rv
sudo makewhatis -a
chsh -s /bin/zsh
sudo reboot
