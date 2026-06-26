if status is-interactive
# Commands to run in interactive sessions can go here
end

# Created by `pipx` on 2026-05-21 04:23:23
set PATH $PATH /home/aniketmondal/.local/bin

alias ls="ls --color=never --indicator-style=classify -lah"
alias catfile="~/dev/dotfiles/scripts/catfile.sh"
alias openpdf="~/dev/dotfiles/scripts/openpdf.sh"
alias fastfetch="fastfetch --logo ~/Downloads/garfield_banging.png --logo-height 17 --logo-padding 2 --logo-padding-top 1"
alias imageopen="~/dev/dotfiles/scripts/imageopen.sh"
alias wallpaper="~/dev/dotfiles/scripts/wallpaper.sh"

set -g PROJECTS_DIRS \
    $HOME \
    $HOME/.config \
    $HOME/.local/share \
    $HOME/.local/share/nvim/lazy \
    $HOME/dev \
    $HOME/dev/projects \
    $HOME/dev/dotfiles

function fzf-cd
    set dir (printf "%s\n" $PROJECTS_DIRS | while read -l base
        if test -d "$base"
            find "$base" -mindepth 1 -maxdepth 1 -type d 2>/dev/null
        end
    end | fzf)

    if test -n "$dir"
        cd "$dir"
        commandline -f repaint
    end
end

bind \cd fzf-cd
bind -M insert \cd fzf-cd

bind \ec fzf-cd
bind -M insert \ec fzf-cd

set -U nvm_default_version 26.3.0

