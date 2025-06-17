# installs and sets up the config for kitty
function setup_kitty() {
    # Install
    install kitty

    # Ensure Folder
    mkdir -p $HOME/.config/kitty

    # Link
    link $DOTFILES/.config/kitty/kitty.conf $HOME/.config/kitty/kitty.conf
}