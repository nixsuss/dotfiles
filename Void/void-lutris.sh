#!/bin/bash
set -eu
sudo xbps-install -Sy MangoHud MangoHud-32bit gamemode wine wine-32bit lutris
sudo makewhatis -a
