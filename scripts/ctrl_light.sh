#!/bin/bash

# Avoid to use xbacklight, because when you try to call xbacklight too many times in a short time, it would cost a lot of resources.
# This user should be added to the video group.

ICON="$HOME/.dwm/res/sun.png"

nocnoc_plus() {
    dunstify -i $ICON  -t 1500 -r 2601 -u normal "   $(printf %$(bc <<< "scale=0; ($(light)+2.5)/5")s|tr ' ' '>')"
}

nocnoc_minus() {
    dunstify -i $ICON  -t 1500 -r 2601 -u normal "   $(printf %$(bc <<< "scale=0; ($(light)+2.5)/5")s|tr ' ' '<')"
}

case $1 in
    down)
        light -U 5
        nocnoc_minus
        ;;
    up)
        light -A 5
        nocnoc_plus
        ;;
esac
