#!/bin/bash

case "$BLOCK_BUTTON" in
    1) pavucontrol & ;;
    3) pactl set-sink-mute @DEFAULT_SINK@ toggle ;;
    4) pactl set-sink-volume @DEFAULT_SINK@ +5% ;;
    5) pactl set-sink-volume @DEFAULT_SINK@ -5% ;;
esac

VOL=$(pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}' | head -n1)
MUTE=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')

if [ "$MUTE" = "yes" ]; then
    echo "󰝟 Muted"
else
    echo "󰕾 $VOL"
fi

