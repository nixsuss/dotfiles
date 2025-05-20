#!/bin/bash
xbps-install -Su
xbps-install -Suy xbps
xbps-install -Sy void-repo-nonfree
xbps-install -Sy intel-ucode linux-firmware
xbps-reconfigure -afv
chsh -s /bin/bash
