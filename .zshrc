# Prompt
PROMPT='%F{39}%1~%f %# '
RPROMPT='%F{2}%*%f'

# VIM binding
bindkey -v

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
