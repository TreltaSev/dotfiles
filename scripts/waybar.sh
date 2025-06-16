function setup_waybar() {
    # Install
    install waybar

    # Ensure Folder
    mkdir -p $HOME/.config/waybar

    # Link
    link $DOTFILES/.config/waybar $HOME/.config/waybar
}