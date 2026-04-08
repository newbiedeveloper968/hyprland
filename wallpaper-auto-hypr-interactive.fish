#!/usr/bin/env fish

# -----------------------------
# Directories
# -----------------------------
set VID_DIR "$HOME/Pictures/live_wallpapers"

# Kill any existing wallpaper processes
pkill -f mpvpaper

# -----------------------------
# List videos for Rofi menu
# -----------------------------
set VIDEOS (ls $VID_DIR/*.mp4)
set NAMES ()
for v in $VIDEOS
    set NAMES $NAMES (basename $v)
end

# -----------------------------
# Rofi menu to select wallpaper
# -----------------------------
set CHOICE (printf "%s\n" $NAMES | rofi -dmenu -i -p "Select Wallpaper:")
if test -z "$CHOICE"
    exit 1
end

set VIDEO "$VID_DIR/$CHOICE"

# -----------------------------
# Play the selected video as wallpaper
# -----------------------------
mpvpaper -o "loop --hwdec=auto --no-audio --framedrop=vo --vf=fps=60" "*" "$VIDEO" &
