#!/bin/bash

current=$(setxkbmap -query | awk '/layout/ {print $2}')

if [ "$current" = "us" ]; then
    setxkbmap br
    notify-send "Keyboard layout" "Português (BR)"
else
    setxkbmap us
    notify-send "Keyboard layout" "US"
fi

