# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

setopt autocd extendedglob nomatch
zstyle :compinstall filename '/home/aniketmondal/.zshrc'

autoload -Uz compinit
compinit

zstyle ':completion:*' menu select
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"

setopt ALWAYS_TO_END


_comp_options+=(globdots)


bindkey -v
export KEYTIMEOUT=1


WORDCHARS="*?_-.[]~=&;!#$%^(){}<>"
bindkey -M viins '^W' backward-kill-word
bindkey -M viins '^[[1;5C' vi-forward-word-end
bindkey -M viins '^[[1;5D' backward-word


# Fix backspace in vi insert mode
bindkey -M viins '^?' backward-delete-char


source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh


setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT




autoload -Uz vcs_info
precmd() { vcs_info }

# zstyle ':vcs_info:git:*' formats ' git:(%b)'
# PS1='> %~${vcs_info_msg_0_} '

setopt prompt_subst
# echo " ( .-.)"
PS1='%~${vcs_info_msg_0_}> '
zstyle ':vcs_info:git:*' formats ' (%b)'



alias ls="ls -l -a -F"
alias vim="nvim"


source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh


