#!/bin/bash

# Disable notifications via dbus
export DBUS_SESSION_BUS_ADDRESS=""

# CONFIG
SAVE_DIR="/home/entitybtw/screenshots"
TEMP_DIR="/tmp"
# END CONFIG

# Ensure the save directory exists
mkdir -p "$SAVE_DIR"

# Generate the filename
filename="Screenshot_$(date '+%Y-%m-%d_%H-%M-%S').png"
filepath="$SAVE_DIR/"
tempfilepath="$TEMP_DIR/temp_screenshot.png"

# Input via rofi
delay=$(printf "🕰 No delay\n⏰ 1s delay\n⏰ 3s delay\n⏰ 5s delay\n⏰ 10s delay" | rofi -dmenu -p "|" -lines 5) || exit 1
action=$(printf "🖼️ Save as file\n📋 Copy to clipboard" | rofi -dmenu -p "|" -lines 2) || exit 1
region=$(printf "📷 Full screen screenshot\n📷 Selected area screenshot\n🪟 Selected window screenshot" | rofi -dmenu -p "|" -lines 3) || exit 1

# Convert delay to seconds
case "$delay" in
    "⏰ 1s delay") sleep 1 ;;
    "⏰ 3s delay") sleep 3 ;;
    "⏰ 5s delay") sleep 5 ;;
    "⏰ 10s delay") sleep 10 ;;
esac

# Set mode (screen/area/window)
scr_mode="output"
[ "$region" == "📷 Selected area screenshot" ] && scr_mode="region"
[ "$region" == "🪟 Selected window screenshot" ] && scr_mode="window"

if [ "$action" == "📋 Copy to clipboard" ]; then
    # For clipboard: save to temporary file and copy
    hyprshot -m "$scr_mode" --clipboard-only
    echo "📋 Screenshot copied to clipboard."
elif [ "$action" == "🖼️ Save as file" ]; then
    # For saving as file
    PATH=/tmp/fake-bin:$PATH hyprshot -m "$scr_mode" -o "$filepath"
    if [ -f "$filepath" ]; then
        echo "🖼️ Screenshot saved to $filepath."
    else
        echo "Error: failed to save file."
        # exit 1
    fi
fi
