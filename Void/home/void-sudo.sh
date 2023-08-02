#!/bin/bash
set -euo pipefail
sudo mv -iv ignore.conf /etc/xbps.d/
sudo xbps-install -Suy
sudo xbps-install -S xorg xorg-server-devel nvidia gvim pipewire alsa-utils alsa-pipewire noto-fonts-emoji noto-fonts-ttf-extra dejavu-fonts-ttf elogind dbus-elogind dbus-elogind-x11 dbus-elogind-libs polkit polkit-gnome wireplumber libjack-pipewire neofetch rxvt-unicode base-devel libX11-devel libXft-devel libXinerama-devel chrony git curl wget nitrogen scrot firefox firefox-i18n-en-US firefox-i18n-ar xdg-utils pcmanfm file-roller pavucontrol neofetch htop font-firacode breeze-cursors lxappearance gvfs gvfs-mtp mtpfs gvfs-gphoto2 ntfs-3g dialog mtools smartmontools qt5ct qbittorrent slock xss-lock rsync mpv mpc mpd ncmpcpp zsh zsh-completions dconf-editor galculator-gtk3 ufw gparted gnome-disk-utility papirus-icon-theme breeze-icons kvantum picom amiri-font font-sil-scheherazade font-sil-lateef NetworkManager socklog-void torbrowser-launcher rofi dunst nerd-fonts yaru obfs4proxy numlockx clipmenu qt5-styleplugins xtools leafpad zathura-pdf-mupdf redshift sxiv xclip figlet figlet-fonts lolcat-c bottom dust yt-dlp bat lsd ffmpeg conky fribidi-devel kitty lf trash-cli terminus-font p7zip-unrar pfetch man-pages-devel man-pages-posix sound-theme-freedesktop
sudo rm -rf /var/service/dhcpcd
sudo xbps-remove -RFy dhcpcd
sudo mkdir -v /etc/cron.weekly/
echo "#!/bin/sh
fstrim /" | sudo tee -a /etc/cron.weekly/fstrim
sudo chmod 777 /etc/cron.weekly/fstrim
echo "set number" | sudo tee -a /etc/vimrc.local
sudo ln -sv /etc/sv/{elogind,dbus,polkitd,ntpd,ufw,socklog-unix,nanoklogd,NetworkManager,tor} /var/service/
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
sudo mv -iv .local/bin/librewolf /usr/bin/
sudo cp -v figlet/* /usr/share/figlet/
rm -rf figlet
mkdir -pv Pictures/screenshots
mkdir -pv .cache/mpd
fc-cache -rv
sudo makewhatis -a
sudo reboot
