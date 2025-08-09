#!/bin/bash

# Function to run Rofi with the specified menu
update_grub() {
    kitty -e sudo grub-mkconfig -o /boot/grub/grub.cfg
}

grub_cfg() {
    kitty -e sudo nano /etc/default/grub
}

extra_buttons_cfg() {
    kitty -e sudo nano /etc/grub.d/40_custom
}

grub_customizer() {
    kitty -e grub-customizer
}

# Menu
main_menu() {
    while true; do
        choice=$(echo -e "Update GRUB ->\nGRUB Config ->\nAdditional buttons config ->\nGRUB Customizer ->" | rofi -dmenu -p "|")
        case $choice in
            "Update GRUB ->")
                pkill rofi  # Terminate the current Rofi process
                update_grub # Start the GRUB update process
                ;;
            "GRUB Config ->")
                pkill rofi  # Terminate the current Rofi process
                grub_cfg  # Start editing the GRUB config
                ;;
            "Additional buttons config ->")
                pkill rofi  # Terminate the current Rofi process
                extra_buttons_cfg  # Start editing the GRUB config to add new buttons
                ;;
            "GRUB Customizer ->")
                pkill rofi  # Terminate the current Rofi process
                grub_customizer  # Launch GRUB Customizer
                ;;
            *) exit ;;  # Exit the script on any other choice
        esac
    done
}

main_menu
