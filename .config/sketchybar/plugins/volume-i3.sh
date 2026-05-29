#!/bin/bash
VOL=$(osascript -e "output volume of (get volume settings)" 2>/dev/null)
MUTED=$(osascript -e "output muted of (get volume settings)" 2>/dev/null)

if [ "$MUTED" = "true" ] || [ "$VOL" = "0" ]; then
    sketchybar --set "$NAME" icon.drawing=off label="VOL: mute"
else
    sketchybar --set "$NAME" icon.drawing=off label="VOL: ${VOL}%"
fi
