#!/bin/bash
set -eu
ln -sfv /usr/share/zoneinfo/Africa/Cairo /etc/localtime
hwclock --systohc
sed -i 's/^#\(en_US.UTF-8 UTF-8\)/\1/' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo "ArchLinux" > /etc/hostname
pacman -Syyu --noconfirm
pacman -S --needed --noconfirm intel-ucode man-db man-pages base-devel grub efibootmgr dhcpcd nano sudo
passwd
useradd -mG wheel -s /bin/bash ahmed
passwd ahmed
grub-install --bootloader-id=ArchLinux
grub-mkconfig -o /boot/grub/grub.cfg
EDITOR=nano visudo