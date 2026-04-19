#!/bin/sh

set -e

pkg update 
pkg install xlibre-nvidia-driver xlibre doas nvidia-settings
sysrc kld_list+="nvidia-modeset linux linux64"
sysrc linux_enable=YES

echo 'make sure you are in wheel operator video groups by runing command "groups"'
echo 'if not run pw groupmod <groupname> -m <username>'
