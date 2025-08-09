#!/bin/bash

CONFIG_PATH="$HOME/.config/hypr/hyprland.conf"

# Define the range of refresh rates and step
MIN_RATE=50
MAX_RATE=120
STEP=1

# Generate available modes dynamically
AVAILABLE_MODES=""
for rate in $(seq $MIN_RATE $STEP $MAX_RATE); do
    AVAILABLE_MODES+="1920x1080@${rate}.00Hz\n"
done

select_refresh_rate() {
    echo -e "$AVAILABLE_MODES" | rofi -dmenu -p ""
}

update_hyprland_config() {
    local rate=$1
    sed -i "s/^\$refreshRate = .*/\$refreshRate = ${rate}/" "$CONFIG_PATH"
    hyprctl reload
}

main_menu() {
    selected_rate=$(select_refresh_rate)
    if [ -n "$selected_rate" ]; then
        update_hyprland_config "$(echo "$selected_rate" | awk -F'@' '{print $2}' | sed 's/Hz//')"
    fi
}

main_menu
