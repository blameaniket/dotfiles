#!/usr/bin/env bash

selection=`rg --files . -g '*.png*' -g '*.jpg*' -g '*.jpeg*' | fzf`
feh --image-bg black $selection &
