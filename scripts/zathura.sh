#!/usr/bin/env bash

PDF_DIRS=(
  "$HOME/Downloads"
  "/media/sf_arch_vm_shared_folder/"
)

selected=$(rg --files "${PDF_DIRS[@]}" -g "*.pdf" -g "*.PDF" 2>/dev/null | fzf)

if [[ -z "$selected" ]]; then
  exit 0
fi

zathura "$selected" >/dev/null 2>&1 &
exit 0
