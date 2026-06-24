#!/usr/bin/env bash

FILE="~/Downloads/pictures/$(date '+%Y-%m-%d_%H-%M-%S').png"

maim -s "$FILE"

xclip -selection clipboard -t image/png -i "$FILE"

feh --image-bg black "$FILE" &
