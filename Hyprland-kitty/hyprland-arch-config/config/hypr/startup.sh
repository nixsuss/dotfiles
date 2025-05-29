#!/bin/bash
pkill polkit-gnome-au
pkill mako
pkill mpd
pkill mpDris2
pkill hypridle
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
mako &
hypridle &
#mpd &
sleep 2
#mpDris2 &
waybar &
