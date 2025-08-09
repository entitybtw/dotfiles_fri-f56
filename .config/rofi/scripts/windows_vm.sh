#!/bin/bash

# Function to launch Rofi with the specified menu
rebootwindows() {
    sudo -u entitybtw kitty -e docker-compose --file ~/.config/winapps/compose.yaml down && docker-compose --file ~/.config/winapps/compose.yaml up && docker-compose --file ~/.config/winapps/compose.yaml start
}

closewindows() {
    sudo -u entitybtw kitty -e bash /home/entitybtw/scripts/closefreerdp.sh && sleep 3
}

windows() {
    sudo -u entitybtw kitty -e bash /home/entitybtw/scripts/closefreerdp.sh && xfreerdp /u:Docker /p:303404505 /v:127.0.0.1 /cert:ignore +gfx-h264 +gfx-thin-client /dynamic-resolution
}

# Menu
main_menu() {
    while true; do
        choice=$(echo -e "Reboot Windows VM ->\nClose Stuck VM Windows ->\nOpen Windows VM ->" | rofi -dmenu -p "|")
        case $choice in
            "Reboot Windows VM ->")
                pkill rofi  # Terminate the current Rofi process
                rebootwindows # Start the reboot process for the Windows virtual machine
                ;;
            "Close Stuck VM Windows ->")
                pkill rofi  # Terminate the current Rofi process
                closewindows  # Close stuck windows
                ;;
            "Open Windows VM ->")
                pkill rofi  # Terminate the current Rofi process
                windows  # Open the RDP session with Windows
                ;;
            *) exit ;;  # Exit the script on any other selection
        esac
    done
}

main_menu
