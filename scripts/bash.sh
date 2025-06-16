
# Ensures the default terminal is bash
function ensure_bash() {
    chsh -s /bin/bash
    exec bash
}