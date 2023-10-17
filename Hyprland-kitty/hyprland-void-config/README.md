#This is my Hyprland dotfiles.
-----------------------------------------------------------------------------------------------------------------------------------------------
to install hyprland in void Gnu/linux 

first you have to install xbps-src. follow the instructions here: https://github.com/void-linux/void-packages

after that clone this files by : git clone https://github.com/Makrennel/hyprland-void.git

then move all srcpkgs files to xbps-src/srcpkgs

also append hyprland-void/common/shlibs to xbps-src/common/shlibs

move Waybar-hyprland folder to xbps-src/srcpkgs/

install hyprland and Waybar-hyprland with ./xbps-src

use my hyprlandvoidconfig.sh script for dependences and if u use nvidia uncomment all in the script.

note: my hyprland configurations is configured to fits my needs 

to run hyprland type this command in your tty : dbus-run-session Hyprland

have fun :)
