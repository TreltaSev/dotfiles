# Simply checks if a command exists, raises if not
function has() {
    command -v "$1" >/dev/null
}

# Ensures the default terminal is bash
function ensure_bash() {
    chsh -s /bin/bash
}

# Makes sure sudo is active
function ensure_sudo() {
    # Ask for sudo
    echo "[INFO] Checking sudo"

    if [[ $EUID -ne 0 ]]; then
        echo "[INFO] Requesting sudo"
        exec sudo bash "$0" "$@"
    fi

    HOME="/home/$(logname)"
}

# Ends sudo session
function end_sudo() {
    sudo -k
}

function log() {
    gum log --structured --level "$1" "${@:2}"
}

# Conditional to check if debug is active
function is_debug() {
    if [ "$DEBUG_MODE" = true ]; then
        return 0
    fi
    return 1
}

# ==============================================
# ======= File Modifying Functions Below =======
# ==============================================

# Uses ln to link files
function link() {
    
    if ! is_debug; then 
        sudo ln -sf "$1" "$2"
    fi

    log debug "Link \"$1\" => \"$2\""
}

function install() {

    if yay -Qi "$1" >/dev/null 2>/dev/null; then
        log debug "$1 already installed"
        return 0
    fi

    if ! is_debug; then
        if [[ $EUID -eq 0 ]]; then
            sudo -u "$SUDO_USER" yay -S "$1" --noconfirm >/dev/null
        else
            yay -S "$1" --noconfirm >/dev/null
        fi

    fi

    log info "Installing $1"

}

# $1: content | $2: file
function write() {

    if ! is_debug; then 
        echo -e "$1" >> "$2"
    fi

    log debug "Wrote \"$1\" to \"$2\""
}
