#!/bin/bash

set -e

REPO_URL="https://github.com/TreltaSev/dotfiles.git"
TARGET_DIR="$HOME/dotfiles"

if [ ! -d "$TARGET_DIR" ]; then
  git clone "$REPO_URL" "$TARGET_DIR"
fi

bash "$TARGET_DIR/install.sh"

