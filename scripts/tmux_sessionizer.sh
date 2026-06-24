#!/usr/bin/env bash

PROJECTS_DIRS=(
  "$HOME"
  "$HOME/.config"
  "$HOME/.local/share"
  "$HOME/.local/share/nvim/lazy"
  "$HOME/dev"
  "$HOME/dev/projects"
  "$HOME/dev/dotfiles"
)

selected=$(find "${PROJECTS_DIRS[@]}" -mindepth 1 -maxdepth 1 -type d | fzf)

if [[ -z $selected ]]; then
  exit 0
fi

session=$(basename "$selected" | tr . _)

# If not inside tmux, create session and attach
if ! tmux has-session -t "$session" 2>/dev/null; then
  tmux new-session -ds "$session" -c "$selected"
fi

tmux attach -t "$session"
