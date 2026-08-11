#!/usr/bin/env bash

# cd ~/Downloads/wallpapers/ || exit
selection=`rg --files ~/Downloads/wallpapers | fzf`

if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    if pgrep -x hyprpaper >/dev/null; then
        killall hyprpaper
    fi

    if pgrep -x swaybg >/dev/null; then
        killall swaybg
    fi

    swaybg -i "$selection" -m fill &

elif [ "$XDG_SESSION_TYPE" = "x11" ]; then
    feh --bg-fill $selection &

else
    echo "unknown session type"
    exit 1
fi

echo $selection
