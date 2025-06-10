#!/bin/zsh

# This script reloads Waybar automatically when you make changes to its config or style files.
# You need to have 'inotifywait' (from inotify-tools) installed.

# Path to your Waybar config directory
WAYBAR_CONFIG_DIR="$HOME/.config/waybar"

# Watch for changes in config.json, config, and style.css (adapt as needed)
inotifywait -m -e close_write --format '%w%f' \
  "$WAYBAR_CONFIG_DIR/config" \
  "$WAYBAR_CONFIG_DIR/config.jsonc" \
  "$WAYBAR_CONFIG_DIR/style.css" 2>/dev/null | while read file; do
    echo "Detected change in $file. Reloading Waybar..."
    pkill waybar
    (sleep 0.5 && waybar) &
done
