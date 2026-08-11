#!/usr/bin/env bash

selection=`rg --files . -g '*.png*' -g '*.jpg*' -g '*.jpeg*' | fzf`



if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    imv $selection &

elif [ "$XDG_SESSION_TYPE" = "x11" ]; then
    feh --image-bg black $selection &

else
    echo "unknown session type"
    exit 1
fi

