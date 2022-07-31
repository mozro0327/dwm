#!/bin/bash

PDIR="$HOME/.dwm"

while true
do
	bash $PDIR/dwm_status_refresh.sh
	sleep 1
done
