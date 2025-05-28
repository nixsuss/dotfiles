#!/bin/bash
pkill polkit-gnome-au
pkill mako
pkill mpd
pkill mpDris2
pkill hypridle
pkill blueman-applet
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
blueman-applet &
mako &
hypridle &
#mpd &
sleep 2
#mpDris2 &
waybar &
