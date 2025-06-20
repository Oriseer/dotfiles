#!/bin/zsh
CONFIG_DIR="$HOME/.config/waybar"
if pgrep -x "waybar" > /dev/null; then
  inotifywait -m -e modify,create $CONFIG_DIR | while read path action file; do
    pkill -SIGUSR2 waybar
  done
else
  waybar
fi
