
# Checks if on a arch distro, if not fails
function require_arch() {
    if ! grep -qi "arch" /etc/os-release; then
        echo "[ERROR] This script only supports Arch-based systems." >&2
        exit 1
    fi
}
