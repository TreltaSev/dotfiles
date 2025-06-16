# Checks if the oh-my-posh config is already in bashrc
function ohmyposh_in_bash() {
    if ! (cat $BASHRC | grep -q 'eval "$(oh-my-posh init bash'); then
        return 1
    fi
    return 0
}


# Install Oh-my-posh
function install_ohmyposh() {
    log info "Installing oh-my-posh from" link "https://ohmyposh.dev/install.sh"
    curl -s https://ohmyposh.dev/install.sh | bash -s
    log info "Installed oh-my-posh"
}

# Installs and sets up the config for ohmyposh
function setup_ohmyposh() {

    if ohmyposh_in_bash; then
        log info "oh-my-posh already installed"
        return 0
    fi

    install_ohmyposh

    # Write to bashrc
    echo -e '# Enable oh-my-posh\neval "$(oh-my-posh init bash --config ~/theme.omp.json)\n"' >>$BASHRC
    log info "Added oh-my-posh to \"$BASHRC\""

    # Link File
    link $DOTFILES/.config/oh-my-posh/theme.omp.json $HOME/theme.omp.json
    log info "Linked"
}

