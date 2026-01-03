#!/bin/bash

if [ "$BLOCK_BUTTON" = "1" ]; then
    pkill yad 2>/dev/null || yad \
        --calendar \
        --undecorated \
        --close-on-unfocus \
        --no-buttons \
        --width=300 \
        --height=250 &
fi

date "+󰃭 %d/%m/%Y 󰥔 %H:%M"

