#!/bin/bash
set -eu
sudo xbps-install -Sy MangoHud MangoHud-32bit gamemode wine wine-32bit libgamemode-32bit winetricks wine-mono freetype-32bit gamescope gamescope-32bit steam
sudo makewhatis -a
