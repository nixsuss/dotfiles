#!/bin/bash
set -ue
echo 'repository=https://github.com/index-0/librewolf-void/releases/latest/download/' > /etc/xbps.d/20-librewolf.conf
xbps-install -Su librewolf
