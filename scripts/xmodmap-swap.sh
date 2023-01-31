#!/bin/bash

xmodmap ~/.dwm/xmodmap/Xmodmap-swap

# read flag
flag=$(cat ~/.dwm/xmodmap/flag)

if [ $flag -eq 1 ]; then
    dunstify "Swap Caps and Esc"
    echo "0" > ~/.dwm/xmodmap/flag
else
    dunstify "Recover Caps and Esc"
    echo "1" > ~/.dwm/xmodmap/flag
fi

