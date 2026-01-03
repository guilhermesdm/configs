#!/bin/bash

BAT_PATH="/sys/class/power_supply/BAT0"

[ ! -d "$BAT_PATH" ] && exit 0

CAPACITY=$(cat "$BAT_PATH/capacity")
STATUS=$(cat "$BAT_PATH/status")
ICON="󰁹"

if [ -f "$BAT_PATH/energy_now" ]; then
    NOW=$(cat "$BAT_PATH/energy_now")
    FULL=$(cat "$BAT_PATH/energy_full")
    POWER=$(cat "$BAT_PATH/power_now")
else
    NOW=$(cat "$BAT_PATH/charge_now")
    FULL=$(cat "$BAT_PATH/charge_full")
    POWER=$(cat "$BAT_PATH/current_now")
fi

get_time() {
    if [ "$POWER" -gt 0 ]; then
        if [ "$STATUS" = "Charging" ]; then
            # Time to full
            VAL=$(( (FULL - NOW) * 60 / POWER ))
        else
            # Time remaining
            VAL=$(( NOW * 60 / POWER ))
        fi
        HOURS=$(( VAL / 60 ))
        MINS=$(( VAL % 60 ))
        printf "%02d:%02d" "$HOURS" "$MINS"
    else
        echo "calculating..."
    fi
}

TIME_STR=$(get_time)
LABEL=""

case "$STATUS" in
    Charging) ICON="󰂄"
              LABEL=" ($TIME_STR to full)"
              ;;
    Discharging)
        if [ "$CAPACITY" -le 15 ]; then
            ICON="󰁺"
        elif [ "$CAPACITY" -le 40 ]; then
            ICON="󰁼"
        elif [ "$CAPACITY" -le 70 ]; then
            ICON="󰁾"
        else
            ICON="󰁹"
        fi
        LABEL=" ($TIME_STR left)"
        ;;
    Full) ICON="󰁹" ;;
esac

if [ "$STATUS" = "Discharging" ] && [ "$CAPACITY" -le 10 ]; then
    notify-send -u critical "Bateria baixa" "${CAPACITY}% restante"
fi

echo "$ICON ${CAPACITY}%$LABEL"

