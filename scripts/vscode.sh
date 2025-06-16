ensure_vscode() {
    if ! has code; then
        yay -S --noconfirm visual-studio-code-bin
        echo "[INFO] Installed vscode"
    fi
}