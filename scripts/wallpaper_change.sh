#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/Downloads/wallpapers"
HYPRPAPER_CONF="$HOME/.config/hypr/hyprpaper.conf"
MONITOR="DP-1"

selection=$(rg --files "$WALLPAPER_DIR" | fzf \
    --border=none \
    --preview 'chafa --format symbols --size 60x30 {}' \
    --preview-window='right,60%,border-none')

# Exit if nothing was selected
[ -z "$selection" ] && exit 0

# Convert to ~ path for the config
selection="~/${selection#$HOME/}"



if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    if pgrep -x hyprpaper >/dev/null; then
        killall hyprpaper
    fi

    if pgrep -x swaybg >/dev/null; then
        killall swaybg
    fi

    # Update the path in hyprpaper.conf
    sed -i "s|^[[:space:]]*path = .*|    path = $selection|" "$HYPRPAPER_CONF"

    # Apply wallpaper immediately
    hyprctl hyprpaper wallpaper "$MONITOR,${selection},fill"

elif [ "$XDG_SESSION_TYPE" = "x11" ]; then
    if pgrep -x feh >/dev/null; then
        killall feh
    fi

    sed -i "s|^[[:space:]]*path = .*|    path = $selection|" "$HOME/.config/i3/config"
    feh --bg-fill $selection &

else
    echo "unknown session type"
    exit 1
fi

