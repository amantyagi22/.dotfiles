#!/bin/bash
# Usage: toggle-theme.sh [i3|icons]
# If no arg, toggles between the two.

STATE_FILE="$HOME/.config/sketchybar/.current-theme"
CURRENT=$(cat "$STATE_FILE" 2>/dev/null || echo "i3")

if [ -n "$1" ]; then
    NEXT="$1"
else
    [ "$CURRENT" = "i3" ] && NEXT="icons" || NEXT="i3"
fi

case "$NEXT" in
    i3)    CONFIG="$HOME/.config/sketchybar/sketchybarrc-i3" ;;
    icons) CONFIG="$HOME/.config/sketchybar/sketchybarrc-icons" ;;
    *)     echo "Usage: $0 [i3|icons]"; exit 1 ;;
esac

cp "$CONFIG" "$HOME/.config/sketchybar/sketchybarrc"
echo "$NEXT" > "$STATE_FILE"
pkill sketchybar
sleep 1
/opt/homebrew/bin/sketchybar &

echo "Switched to: $NEXT"
