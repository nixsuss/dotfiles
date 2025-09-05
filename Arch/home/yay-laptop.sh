#!/bin/bash
yay -Syy --noconfirm
yay -S auto-cpufreq brillo networkmanager-dmenu nm-connection-editor
sudo usermod -aG video $USER
sudo systemctl enable --now auto-cpufreq
sudo chmod 777 /sys/class/backlight/intel_backlight/brightness
echo 'Section "InputClass"
Identifier "touchpad catchall"
Driver "libinput"
Option "Tapping" "on"
EndSection' | sudo tee -a /etc/X11/xorg.conf.d/30-touchpad.conf
