#!/bin/bash

SOURCE="@DEFAULT_SOURCE@"

case "$BLOCK_BUTTON" in
    1) pavucontrol --tab=4 & ;;
    3) pactl set-source-mute "$SOURCE" toggle ;;
    4) pactl set-source-volume "$SOURCE" +5% ;;
    5) pactl set-source-volume "$SOURCE" -5% ;;
esac

VOL=$(pactl get-source-volume "$SOURCE" | awk '{print $5}' | head -n1)
MUTE=$(pactl get-source-mute "$SOURCE" | awk '{print $2}')

if [ "$MUTE" = "yes" ]; then
    echo "󰍭 Muted"
else
    echo "󰍬 $VOL"
fi

