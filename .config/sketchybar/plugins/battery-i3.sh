#!/bin/bash
PERCENT=$(pmset -g batt | grep -Eo '[0-9]+%' | head -1 | tr -d '%')
CHARGING=$(pmset -g batt | grep 'AC Power')

if [ -z "$PERCENT" ]; then
    sketchybar --set "$NAME" icon.drawing=off label="BAT: N/A"
    exit
fi

if [ -n "$CHARGING" ]; then
    sketchybar --set "$NAME" icon.drawing=off label="BAT: ${PERCENT}% +" label.color=0xffe1e3e4
elif [ "$PERCENT" -le 20 ]; then
    sketchybar --set "$NAME" icon.drawing=off label="BAT: ${PERCENT}%" label.color=0xffff5555
else
    sketchybar --set "$NAME" icon.drawing=off label="BAT: ${PERCENT}%" label.color=0xffe1e3e4
fi
