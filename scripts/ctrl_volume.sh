#!/bin/bash

ICON="$HOME/.dwm/res/volume.png"
ICON_MUTE="$HOME/.dwm/res/volume-mute.png"

nocnoc_plus() {
    volume=( $(amixer sget Master|awk -F "[][]" 'END{print $2,$4}') )
    bar=$(printf %$((${volume%\%}/5))s|tr ' ' '>')

    [ ${volume[1]} == "on" ] && icon="$ICON" || icon="$ICON_MUTE"

    dunstify -i $icon -t 1500 -r 2601 -u ctrical "    $bar"
}


nocnoc_minus() {
    volume=( $(amixer sget Master|awk -F "[][]" 'END{print $2,$4}') )
    bar=$(printf %$((${volume%\%}/5))s|tr ' ' '<')

    [ ${volume[1]} == "on" ] && icon="$ICON" || icon="$ICON_MUTE"

    dunstify -i $icon -t 1500 -r 2601 -u ctrical "    $bar"
}

nocnoc_equal() {
    volume=( $(amixer sget Master|awk -F "[][]" 'END{print $2,$4}') )
    bar=$(printf %$((${volume%\%}/5))s|tr ' ' '=')

    [ ${volume[1]} == "on" ] && icon="$ICON" || icon="$ICON_MUTE"

    dunstify -i $icon -t 1500 -r 2601 -u ctrical "    $bar"
}

case $1 in
    up)
        amixer set Master 5%+
        nocnoc_plus
        ;;
    down)
        amixer set Master 5%-
        nocnoc_minus
        ;;
    mute)
        amixer set Master toggle
        nocnoc_equal
        ;;
esac
