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

void() {
    kitty --hold -e strat -r void zsh -c "neofetch --ascii_distro void_small && exec zsh" &
}

# Menu
main_menu() {
    choice=$(echo -e "bedrock ->\ngentoo ->\narch ->\nvoid ->" | rofi -dmenu -p "|")
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
        "void ->")
            void
            ;;
        *) exit ;;  # Exit the script on any other choice
    esac
}

main_menu
