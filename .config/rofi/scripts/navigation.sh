#!/bin/bash

# Function to launch Rofi with the specified menu
launch_apps() {
    rofi -modi drun,run -show
}

launch_wallpapers() {
    bash /home/entitybtw/.config/rofi/scripts/wallpaper_launcher.sh
}

launch_grub_settings() {
    bash /home/entitybtw/.config/rofi/scripts/grub_settings.sh
}

launch_windows() {
    bash /home/entitybtw/.config/rofi/scripts/windows_vm.sh
}

launch_screenshots() {
    bash /home/entitybtw/.config/rofi/scripts/rofi-screenshot.sh
}

launch_hz_control() {
    bash /home/entitybtw/.config/rofi/scripts/hz_control.sh
}

# Main menu
main_menu() {
    while true; do
        choice=$(echo -e "Applications ->\nWallpapers ->\nScreenshots ->\nGRUB ->\nWindows VM ->\nHz Control ->" | rofi -dmenu -p "|")
        case $choice in
            "GRUB ->")
                pkill rofi  # Terminate the current Rofi process
                launch_grub_settings  # Launch GRUB settings
                ;;
            "Applications ->")
                pkill rofi  # Terminate the current Rofi process
                launch_apps  # Launch applications menu
                ;;
            "Wallpapers ->")
                pkill rofi  # Terminate the current Rofi process
                launch_wallpapers  # Launch wallpaper selection menu
                ;;
            "Windows VM ->")
                pkill rofi  # Terminate the current Rofi process
                launch_windows  # Launch Windows settings (VM)
                ;;
            "Screenshots ->")
                pkill rofi  # Terminate the current Rofi process
                launch_screenshots  # Launch screenshot menu
                ;;
            "Hz Control ->")
                pkill rofi  # Terminate the current Rofi process
                launch_hz_control  # Launch screenshot menu
                ;;
            *) exit ;;  # Exit the script on any other selection
        esac
    done
}

main_menu
