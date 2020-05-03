# VIM binding
bindkey -v

# Remove mode switching delay
KEYTIMEOUT=5

# Map vim mode to var
VIM_MODE="[ins]"

function zle-keymap-select {
    VIM_MODE="${${KEYMAP/vicmd/[cmd]}/(main|viins)/[ins]}"
    zle reset-prompt
}

zle -N zle-keymap-select

# Prompt, with variable substition
setopt PROMPT_SUBST
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
