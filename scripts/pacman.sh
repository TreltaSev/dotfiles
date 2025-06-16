function update_pacman() {
    require_arch
    sudo pacman -Syu
    echo "[INFO] Updated Packages"
}