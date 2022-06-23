#!/usr/bin/env bash

## Copyright (C) 2020-2021 Aditya Shakya <adi1090x@gmail.com>
## Everyone is permitted to copy and distribute copies of this file under GNU-GPL3

DIR="$HOME/.config/bspwm"

rofi_command="rofi -theme $DIR/rofi/themes/powermenu.rasi"

uptime=$(uptime -p | sed -e 's/up //g')

# Options
shutdown=""
reboot=""
lock=""
suspend=""
logout=""

# Variable passed to rofi
options="$shutdown\n$reboot\n$lock\n$suspend\n$logout"
#_msg="Options  -  yes / y / no / n"

chosen="$(echo -e "$options" | $rofi_command -p "Tempo ligado - $uptime" -dmenu -selected-row 2)"
case $chosen in
    $shutdown)
        systemctl poweroff
        ;;
    $reboot)
        systemctl reboot
        ;;
    $lock)
        i3lock -c 000000
        ;;
    $suspend)
		systemctl suspend
        ;;
    $logout)
        bspc quit
        ;;
esac

