# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Enable history-based completion
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

bind '"\C-f": "~/.local/scripts/tmux-sessionizer\n"'

# prompt
source ~/.local/scripts/get_prompt.sh

# alias
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias v='nvim'

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

