#!/bin/bash
set -eu
sudo xbps-install -Sy MangoHud MangoHud-32bit gamemode wine wine-32bit lutris libgamemode-32bit wine-mono winetricks libwine-32bit freetype-32bit
sudo makewhatis -a
