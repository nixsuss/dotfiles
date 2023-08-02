#!/bin/bash
pkill polkit-gnome-au
pkill pipewire
pkill mako
pkill mpd
pkill mpDris2
/usr/libexec/polkit-gnome-authentication-agent-1 &
pipewire &
pipewire-pulse &
mako &
#mpd &
sleep 2
#mpDris2 &
waybar &
