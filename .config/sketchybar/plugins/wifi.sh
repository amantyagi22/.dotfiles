#!/bin/bash
SSID=$(ipconfig getsummary en0 2>/dev/null | awk -F ' SSID : ' '/ SSID/ {print $2; exit}')

if [ -z "$SSID" ]; then
    sketchybar --set "$NAME" icon.drawing=off label="W: down" label.color=0xffff5555
else
    sketchybar --set "$NAME" icon.drawing=off label="W: up" label.color=0xffe1e3e4
fi
