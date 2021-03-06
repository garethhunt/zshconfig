# VIM binding
bindkey -v

# Remove mode switching delay
KEYTIMEOUT=5

# Map vim mode to var
VIM_CMD="%B%K{11}%F{0}[cmd]%f%k%b"
VIM_INS="%F{11}[ins]%f"
VIM_MODE=$VIM_INS

function zle-line-init zle-keymap-select {
    VIM_MODE="${${KEYMAP/vicmd/${VIM_CMD}}/(main|viins)/${VIM_INS}}"
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

# Prompt, with variable substition
setopt PROMPT_SUBST
setopt TRANSIENT_RPROMPT
PROMPT='%F{39}%1~%f %# '
RPROMPT='${VIM_MODE} %F{2}%*%f'

# Change directory without typing cd
setopt AUTOCD

# Completions
autoload -Uz compinit && compinit

# Correction - commands
setopt CORRECT
# Correction - args
setopt CORRECT_ALL

#
# History configuration
#

# History commands
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

# Max history saved
SAVEHIST=5000
# Include timestamp
setopt EXTENDED_HISTORY
# share history across multiple zsh sessions
setopt SHARE_HISTORY
# append to history
setopt APPEND_HISTORY
# expire duplicates first
setopt HIST_EXPIRE_DUPS_FIRST
