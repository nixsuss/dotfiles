#!/bin/bash
sudo pacman -Syy --noconfirm
sudo pacman -S cups cups-pdf hplip system-config-printer cups-filters nss-mdns cups-browsed 
sudo usermod -aG lp $USER
sudo systemctl enable --now cups.service avahi-daemon cups-browsed.service
sudo ufw allow 5353/udp 631/tcp 9100/tcp 80/tcp 443/tcp
