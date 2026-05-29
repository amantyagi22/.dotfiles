#!/bin/bash
STATE=$(system_profiler SPBluetoothDataType 2>/dev/null | awk '/Bluetooth Controller:/,/Discoverable:/' | grep 'State:' | awk '{print $2}')

if [ "$STATE" = "On" ]; then
    sketchybar --set "$NAME" icon.drawing=off label="BT: on" label.color=0xffe1e3e4
else
    sketchybar --set "$NAME" icon.drawing=off label="BT: off" label.color=0xff565f89
fi
