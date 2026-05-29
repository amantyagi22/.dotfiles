#!/bin/bash
VOL=$(osascript -e "output volume of (get volume settings)" 2>/dev/null)
MUTED=$(osascript -e "output muted of (get volume settings)" 2>/dev/null)

if [ "$MUTED" = "true" ] || [ "$VOL" = "0" ]; then
    sketchybar --set "$NAME" icon="󰝟" icon.color=0xff565f89 label=""
    exit
fi

if   [ "$VOL" -ge 66 ]; then ICON="󰕾"
elif [ "$VOL" -ge 33 ]; then ICON="󰖀"
else                          ICON="󰕿"
fi

sketchybar --set "$NAME" icon="$ICON" icon.color=0xff89ddff label="${VOL}%"
