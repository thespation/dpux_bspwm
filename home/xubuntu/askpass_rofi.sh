#!/usr/bin/env bash

## rofi dir
DIR="$HOME/.config/bspwm/rofi/dialogs"

rofi 	-dmenu\
		-password\
		-i\
		-no-fixed-num-lines\
		-p "Senha de root: "\
		-theme "$DIR"/askpass.rasi
