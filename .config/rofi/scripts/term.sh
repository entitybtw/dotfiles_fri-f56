#!/bin/bash

# Function to launch terminal with the specified menu
bedrock() {
    kitty --hold -e fastfetch &
}

gentoo() {
    kitty --hold -e strat -r gentoo zsh -c "neofetch --ascii_distro gentoo_small && exec zsh" &
}

arch() {
    kitty --hold -e strat -r arch zsh -c "neofetch --ascii_distro arch_small && exec zsh" &
}

# Menu
main_menu() {
    choice=$(echo -e "bedrock ->\ngentoo ->\narch ->" | rofi -dmenu -p "|")
    case "$choice" in
        "bedrock ->")
            bedrock
            ;;
        "gentoo ->")
            gentoo
            ;;
        "arch ->")
            arch
            ;;
        *) exit ;;  # Exit the script on any other choice
    esac
}

main_menu
