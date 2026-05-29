#!/bin/bash
SSID=$(ipconfig getsummary en0 2>/dev/null | awk -F ' SSID : ' '/ SSID/ {print $2; exit}')

if [ -z "$SSID" ]; then
    sketchybar --set "$NAME" icon="󰤭" icon.color=0xff565f89 label="off" label.color=0xff565f89
else
    sketchybar --set "$NAME" icon="󰤨" icon.color=0xffff9e64 label="" label.color=0xffe1e3e4
fi
