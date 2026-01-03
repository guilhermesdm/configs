#!/bin/bash

BRIGHTNESS=$(brightnessctl get)
MAX_BRIGHTNESS=$(brightnessctl max)
PERCENTAGE=$(( BRIGHTNESS * 100 / MAX_BRIGHTNESS ))

case "$BLOCK_BUTTON" in 
  4) brightnessctl set 10%+ > /dev/null ;;
  5) brightnessctl set 10%- > /dev/null ;;
esac

echo "${PERCENTAGE}%"
