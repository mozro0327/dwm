#!/bin/bash

xrandr --auto --output eDP-1 --below HDMI-1 --size 1920x1080
# xrandr --auto --output eDP-1 --same-as HDMI-1 --size 1920x1080
/bin/bash $HOME/.dwm/dwm_status.sh &
/bin/bash $HOME/.dwm/wp-autochange.sh &
dbus-update-activation-environment DISPLAY

picom --experimental-backend &
# aria2c --enable-rpc &
udiskie &
greenclip daemon &
clash &
# libinput-gestures &
nm-applet &
fcitx5 -d &
blueman-applet &
# redshift &
xfce4-power-manager &
wmname LG3D &
nohup /usr/lib/gsd-xsettings > /dev/null 2>&1 &
# /usr/bin/prime-offload

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1

sleep 10

