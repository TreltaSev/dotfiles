# Installs and sets up hyprland
function setup_hyprland() {
    # Install
    install hyprland

    # Ensure Folder
    mkdir -p $HOME/.config/hypr

    # Link
    link $DOTFILES/.config/hypr/hyprland.conf $HOME/.config/hypr/hyprland.conf
}
