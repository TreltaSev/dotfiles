

# Makes sure gum is installed
function ensure_gum() {
    if ! has gum; then
        echo "[INFO] Installing gum..."
        yay -S --noconfirm gum > /dev/null
        echo "[INFO] Installed gum"
    fi
}


# Using Gum, ask the user which scripts to run
function prompt_installation_options() {
    local scripts=("code" "git" "otheroption" "hyprland")
    local selected
    selected=$(printf "%s\n" "${scripts[@]}" | gum choose --no-limit)

    for choice in $selected; do
        local fn="${choice}_install"
        if declare -f "$fn" > /dev/null; then
            "$fn"
        else
            echo "[WARN] No such function: $fn"
        fi
    done

}