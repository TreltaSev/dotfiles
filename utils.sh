# Simply checks if a command exists, raises if not
function has() {
    command -v "$1" >/dev/null
}

# Makes sure sudo is active
function ensure_sudo() {
    # Ask for sudo
    echo "[INFO] Checking sudo"

    if [[ $EUID -ne 0 ]]; then
        echo "[INFO] Requesting sudo"
        exec sudo bash "$0" "$@"
    fi

    HOME="${SUDO_USER:+/home/$SUDO_USER}/"
}

# Ends sudo session
function end_sudo() {
    sudo -k
}

function install() {
    if [[ $EUID -eq 0 ]]; then
        sudo -u "$SUDO_USER" yay -S "$1" --noconfirm >/dev/null
    else
        yay -S "$1" --noconfirm >/dev/null
    fi
    log info "Installing $1"

}

function log() {
    gum log --structured --level "$1" "${@:2}"
}

# Uses ln to link files
function link() {
    sudo ln -sf "$1" "$2"
    log debug "Link \"$1\" => \"$2\""
}
