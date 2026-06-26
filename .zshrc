HISTFILE=~/.histfile
HISTSIZE=50000
SAVEHIST=50000

setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS


setopt autocd extendedglob nomatch
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT
setopt ALWAYS_TO_END

_comp_options+=(globdots)


autoload -Uz compinit
compinit -C

zstyle ':completion:*' menu select
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$HOME/.cache/zsh/zcompcache"


autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search

zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search

bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

bindkey '^[[5D' backward-word
bindkey '^[[5C' forward-word


autoload -Uz vcs_info

zstyle ':vcs_info:git:*' formats ' (%b)'
zstyle ':vcs_info:*' enable git

precmd() { vcs_info }

setopt prompt_subst
PS1='➜ %~${vcs_info_msg_0_} '


alias ls='ls -l -a -F'
alias vim='nvim'


export PATH="$HOME/.atuin/bin:$PATH"


[[ -d ~/.cache/zsh ]] || mkdir -p ~/.cache/zsh



eval "$(atuin init zsh --disable-up-arrow)"
