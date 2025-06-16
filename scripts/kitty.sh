# installs and sets up the config for kitty
function setup_kitty() {
    # Install
    install kitty

    # Ensure Folder
    mkdir -p $HOME/.config/waybar

    # Link
    link $DOTFILES/.config/kitty $HOME/.config/waybar
}