#!/bin/bash
set -eu
sudo xbps-install -Sy gamemode wine wine-32bit libgamemode-32bit winetricks wine-mono freetype-32bit gamescope gamescope-32bit gst-plugins-bad1 gst-libav gst-libav-32bit gst-plugins-bad1-32bit gst-plugins-ugly1 gst-plugins-ugly1-32bit gst-plugins-good1-32bit gst-plugins-good1 gst-plugins-base1 gst-plugins-base1-32bit qarma 7zip gstreamer1 gstreamer1-32bit gstreamer1-pipewire gstreamer1-pipewire-32bit
sudo makewhatis -a
echo
echo "Mangohud is not installed!!!"
echo "To install it go to this link: https://github.com/flightlessmango/MangoHud/releases"
echo "Download the file under Releases"
echo "Extract it, and from within the extracted folder in terminal, execute:"
echo "./mangohud-setup.sh install"
echo "After that run this command: sudo makewhatis -a"
