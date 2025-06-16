#!/bin/bash
CONFIG_FILES="$HOME/.config/waybar/style.css $HOME/.config/waybar/config"
trap "killall waybar" EXIT
while true; do
    waybar &
    inotifywait -e modify $CONFIG_FILES
    killall waybar
done
