#!/bin/bash
set -euo pipefail
sudo xbps-install -Suy
sudo xbps-install -S xorg xorg-server-devel nvidia gvim pipewire alsa-utils alsa-pipewire noto-fonts-emoji noto-fonts-ttf-extra dejavu-fonts-ttf elogind dbus-elogind dbus-elogind-x11 dbus-elogind-libs polkit polkit-gnome wireplumber libjack-pipewire neofetch rxvt-unicode base-devel libX11-devel libXft-devel libXinerama-devel chrony git curl wget nitrogen scrot dmenu chromium pcmanfm file-roller pavucontrol neofetch htop font-firacode breeze-cursors lxappearance gvfs gvfs-mtp mtpfs gvfs-gphoto2 ntfs-3g dialog mtools nomacs smartmontools qt5ct vlc qbittorrent slock xss-lock rsync mpv mpc mpd ncmpcpp ranger ueberzug zsh zsh-completions dconf-editor galculator-gtk3 ufw mupdf gparted gnome-disk-utility papirus-icon-theme breeze-icons kvantum picom amiri-font font-sil-scheherazade font-sil-lateef NetworkManager socklog-void torbrowser-launcher rofi dunst nerd-fonts yaru obfs4proxy numlockx clipmenu qt5-styleplugins xtools leafpad zathura-pdf-mupdf
sudo rm -rf /var/service/dhcpcd
sudo xbps-remove -RFy dhcpcd
sudo mkdir /etc/cron.weekly/
echo "#!/bin/sh
fstrim /" | sudo tee -a /etc/cron.weekly/fstrim
sudo chmod 777 /etc/cron.weekly/fstrim
echo "set number" | sudo tee -a /etc/vimrc.local
sudo ln -sv /etc/sv/{elogind,dbus,polkitd,ntpd,ufw,socklog-unix,nanoklogd,NetworkManager,tor} /var/service/
sudo sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT="loglevel=4/GRUB_CMDLINE_LINUX_DEFAULT="loglevel=4 mitigations=off/' /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg
sudo ufw enable
sudo mkdir -p /etc/alsa/conf.d
sudo ln -sv /usr/share/alsa/alsa.conf.d/* /etc/alsa/conf.d/
sudo ln -sv /usr/share/fontconfig/conf.avail/70-no-bitmaps.conf /etc/fonts/conf.d/
sudo mkdir /etc/pipewire
sudo cp -i /usr/share/pipewire/pipewire.conf /etc/pipewire/
sudo cp -i /usr/share/pipewire/pipewire-pulse.conf /etc/pipewire/
sudo mv -i ComicMono-Bold.ttf /usr/share/fonts/TTF/
sudo mv -i ComicMono.ttf /usr/share/fonts/TTF/
sudo mv -i .local/bin/librewolf /usr/bin/
mkdir -p Pictures/screenshots
mkdir -p .cache/mpd
fc-cache -rv
sudo reboot