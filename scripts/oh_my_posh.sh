# Checks if the oh-my-posh config is already in bashrc
function ohmyposh_in_bash() {
    if ! (cat $BASHRC | grep -q 'eval "$(oh-my-posh init bash'); then
        return 1
    fi
    return 0
}

# Install Oh-my-posh
function install_ohmyposh() {
    if ! has oh-my-posh; then
        log info "Installing oh-my-posh from" link "https://ohmyposh.dev/install.sh"
        prod_call curl -s https://ohmyposh.dev/install.sh | bash -s
        log info "Installed oh-my-posh"
    fi
}


# Runs the given command(s) only if is_debug returns 1 (fails)
function prod_call() {
    if ! is_debug; then
        "$@"
    fi
}

# Installs and sets up the config for ohmyposh
function setup_ohmyposh() {
    install_ohmyposh

    if ! ohmyposh_in_bash; then        
        # Write to bashrc
        write '# Enable oh-my-posh\neval "$(oh-my-posh init bash --config ~/theme.omp.json)\n"' $HOME/.bashrc
        log info "Added oh-my-posh to \"$HOME/.bashrc\""
        return 0
    fi

    # Link File
    link $DOTFILES/.config/oh-my-posh/theme.omp.json $HOME/theme.omp.json
}
