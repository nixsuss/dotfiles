#!/bin/bash
pkill polkit-gnome-au
pkill pipewire
pkill mako
pkill mpd
pkill mpd-mpris
pkill hypridle
/usr/libexec/polkit-gnome-authentication-agent-1 &
pipewire &
pipewire-pulse &
mako &
hypridle &
#mpd &
sleep 2
#mpd-mpris &
waybar &
