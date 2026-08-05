#!/usr/bin/env bash

PDF_DIRS=(
  "$HOME/Downloads"
)

selected=$(rg --files "${PDF_DIRS[@]}" -g "*.pdf" -g "*.PDF" 2>/dev/null | fzf)

if [[ -z "$selected" ]]; then
  exit 0
fi

zathura "$selected" >/dev/null 2>&1 &
exit 0
