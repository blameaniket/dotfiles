#!/usr/bin/env bash

selected=`fd . ~/wallpaper | fzf`

feh --bg-fill $selected

echo $selected
