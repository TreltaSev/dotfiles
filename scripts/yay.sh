


# Makes sure gum is installed
function ensure_yay() {
    if ! has yay; then
        # Assume pacman is on the system
        sudo pacman -S yay
        echo "[INFO] Installed yay package manager"
    fi
}