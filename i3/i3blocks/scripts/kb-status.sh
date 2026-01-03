#!/bin/bash
layout=$(setxkbmap -query | awk '/layout/ {print $2}')

case "$BLOCK_BUTTON" in
    1) sh $HOME/.config/i3/scripts/switch-keyboard.sh
esac

if [ "$layout" = "us" ]; then
    echo "US"
else
    echo "BR"
fi

