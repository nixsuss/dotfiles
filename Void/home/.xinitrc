cat ~/.Xresources ~/.cache/wal/xrdb_extra | xrdb -merge
slstatus &
setxkbmap -layout "us,ara(qwerty)" -option grp:win_space_toggle &
exec /usr/libexec/polkit-gnome-authentication-agent-1 &
#nitrogen --restore &
#wal -R
#urxvtd -q -o -f &
picom -b &
pipewire &
pipewire-pulse &
xss-lock slock &
dunst &
clipmenud &
numlockx
#redshift &
#conky -c .config/conkyrc &
nvidia-settings --load-config-only
exec dbus-run-session dwm
