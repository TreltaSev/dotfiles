function setup_wofi() {
    # Install
    install wofi

    # Ensure Folder
    mkdir -p $HOME/.config/wofi

    # Link
    link $DOTFILES/.config/wofi/style.css $HOME/.config/wofi/style.css
}