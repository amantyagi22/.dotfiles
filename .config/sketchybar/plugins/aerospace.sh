#!/bin/bash
SID="$1"
FOCUSED_WS=$(aerospace list-workspaces --focused 2>/dev/null)

case "$SID" in
    1|2|3|4|8|9|10) ALWAYS_SHOW=1 ;;
    *)             ALWAYS_SHOW=0 ;;
esac

COUNT=$(aerospace list-windows --workspace "$SID" 2>/dev/null | grep -c '^.')

if [ "$ALWAYS_SHOW" -eq 0 ] && [ "$COUNT" -eq 0 ] && [ "$SID" != "$FOCUSED_WS" ]; then
    sketchybar --set "space.$SID" drawing=off
    exit
fi

if [ "$SID" = "$FOCUSED_WS" ]; then
    # active: i3 blue filled box, white text
    sketchybar --set "space.$SID" drawing=on \
               label="$SID" label.color=0xffffffff \
               background.drawing=on \
               background.color=0xff4c7899 \
               background.border_color=0xff4c7899
elif [ "$COUNT" -gt 0 ]; then
    # has windows: bright border, bright label
    sketchybar --set "space.$SID" drawing=on \
               label="$SID" label.color=0xffe1e3e4 \
               background.drawing=on \
               background.color=0x00000000 \
               background.border_color=0x99e1e3e4
else
    # empty: dim border, dim label
    sketchybar --set "space.$SID" drawing=on \
               label="$SID" label.color=0xff494d64 \
               background.drawing=on \
               background.color=0x00000000 \
               background.border_color=0x33e1e3e4
fi
