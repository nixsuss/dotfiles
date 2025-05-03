#!/bin/bash
set -ue
sudo xbps-install -Sy libreoffice-gnome libreoffice-i18n-ar libreoffice-i18n-en-US libreoffice-writer libreoffice-calc libreoffice-impress openjdk libreoffice-fonts
sudo makewhatis -a
