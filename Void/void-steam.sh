#!/bin/bash
set -eu
sudo xbps-install -Sy gamemode wine wine-32bit libgamemode-32bit winetricks wine-mono freetype-32bit gamescope gamescope-32bit steam gst-plugins-bad1 gst-libav
sudo makewhatis -a
echo
echo "Mangohud is not installed!!!"
echo "To install it go to this link: https://github.com/flightlessmango/MangoHud/releases"
echo "Download the file under Releases"
echo "Extract it, and from within the extracted folder in terminal, execute:"
echo "./mangohud-setup.sh install"
