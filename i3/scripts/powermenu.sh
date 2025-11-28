#!/bin/bash

options=" Lock\n Logout\n Reboot\n Shutdown\n Suspend"
choice=$(echo -e "$options" | rofi -dmenu -p "Power")

case "$choice" in
    " Lock") i3lock ;;
    " Logout") i3-msg exit ;;
    " Reboot") systemctl reboot ;;
    " Shutdown") systemctl poweroff ;;
    "  Suspend") systemctl suspend ;;
esac

