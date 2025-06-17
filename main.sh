#!/bin/bash

# Dot Files Installer ~ Trelta 6/25

# Load scripts
function load_scripts() {
    source ./utils.sh # Utilities

    for file in ./scripts/*.sh; do
        source "$file"
    done
}

function main() {

    if [ "$1" == "debug" ]; then
        DEBUG_MODE=true
    else
        DEBUG_MODE=false
    fi
    
    # Load all relevant scripts
    load_scripts

    # Make sure it fails if not on arch
    require_arch

    # Embed dotfiles arg to path
    ensure_dotfiles_path

    # Ensure sudo is running
    ensure_sudo "$@"

    # Make sure gum is installed
    ensure_gum

    # === Install Scripts ===

    # - Hyprland setup
    setup_hyprland
    setup_hyprpaper
    setup_wofi
    setup_waybar

    # - Kitty setup
    setup_kitty

    # - Oh-My-Posh setup
    setup_ohmyposh

    # - Extras
    install bun
    install extra/npm
    install discord
    install visual-studio-code-bin
    install firefox

    # Sudo cleanup
    end_sudo
}

main "${@:1}"
