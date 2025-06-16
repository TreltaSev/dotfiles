# Checks if the dotfiles variable already exists, if not raises.
function path_exists() {
    if ! (cat $BASHRC | grep -q 'export DOTFILES'); then
        return 1
    fi
    return 0
}

# Writes a dotfile variable into the ~/.bashrc file
function write_path() {
    echo -e '\n# Dotfiles dir\nexport DOTFILES="$HOME/dotfiles"' >> $BASHRC
    echo "[INFO] Added DOTFILES to $BASHRC"
    return 0
}

# Sources bashrc to refresh the bash environment
function refresh_bash() {
    source ~/.bashrc
}

# Makes sure the dotfiles variable exists
function ensure_dotfiles_path() {
    
    # Set BashRC
    BASHRC="${SUDO_USER:+/home/$SUDO_USER}/.bashrc"

    if ! path_exists; then
        write_path
        refresh_bash
    else
        echo '[INFO] DOTFILES already set in ~/.bashrc'
    fi
}
