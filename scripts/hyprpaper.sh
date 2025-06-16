function setup_hyprpaper() {
    # Install
    install hyprpaper

    # Ensure Folder
    mkdir -p $HOME/.config/hypr

    # Link
    link $DOTFILES/.config/hypr/hyprpaper.conf $HOME/.config/hypr/hyprpaper.conf
}
