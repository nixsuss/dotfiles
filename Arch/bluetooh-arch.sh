#!/bin/bash
set -eu
sudo pacman -S --needed --noconfirm bluez bluez-utils blueman
sudo systemctl enable bluetooth
