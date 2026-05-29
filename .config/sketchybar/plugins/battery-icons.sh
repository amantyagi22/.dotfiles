#!/bin/bash
PERCENT=$(pmset -g batt | grep -Eo '[0-9]+%' | head -1 | tr -d '%')
CHARGING=$(pmset -g batt | grep 'AC Power')

if [ -z "$PERCENT" ]; then
    sketchybar --set "$NAME" icon="󰂎" icon.color=0xff565f89 label=""
    exit
fi

if [ -n "$CHARGING" ]; then
    ICON="󰂄"; COLOR=0xffa9b1d6
elif [ "$PERCENT" -ge 90 ]; then ICON="󰁹";  COLOR=0xff9ece6a
elif [ "$PERCENT" -ge 80 ]; then ICON="󰂂";  COLOR=0xff9ece6a
elif [ "$PERCENT" -ge 70 ]; then ICON="󰂁";  COLOR=0xff9ece6a
elif [ "$PERCENT" -ge 60 ]; then ICON="󰂀";  COLOR=0xffe0af68
elif [ "$PERCENT" -ge 50 ]; then ICON="󰁿";  COLOR=0xffe0af68
elif [ "$PERCENT" -ge 40 ]; then ICON="󰁾";  COLOR=0xffe0af68
elif [ "$PERCENT" -ge 30 ]; then ICON="󰁽";  COLOR=0xffe0af68
elif [ "$PERCENT" -ge 20 ]; then ICON="󰁼";  COLOR=0xfff7768e
elif [ "$PERCENT" -ge 10 ]; then ICON="󰁻";  COLOR=0xfff7768e
else                              ICON="󰁺";  COLOR=0xfff7768e
fi

sketchybar --set "$NAME" icon="$ICON" icon.color="$COLOR" label="${PERCENT}%" label.color=0xffe1e3e4
