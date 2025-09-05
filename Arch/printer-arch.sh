#!/bin/bash
sudo pacman -Syy --noconfirm
sudo pacman -S cups cups-pdf hplip system-config-printer
sudo usermod -aG lp $USER
sudo systemctl enable --now cups.service
