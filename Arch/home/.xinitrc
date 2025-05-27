cat ~/.Xresources ~/.cache/wal/xrdb_extra | xrdb -merge
slstatus &
setxkbmap -layout "us,ara" -option grp:win_space_toggle &
exec /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
#nitrogen --restore &
#wal -R
#urxvtd -q -o -f &
picom -b &
blueman-applet &
xss-lock slock &
dunst &
clipmenud &
numlockx
#redshift &
#conky -c .config/conkyrc &
nvidia-settings --load-config-only
exec dwm
