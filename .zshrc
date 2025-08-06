# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# fat cursor
# 0 blinking line cursor
# 1 blinking block cursor
# 2 steady block cursor
echo -ne "\033[2 q"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export DISABLE_AUTO_TITLE='true'
export EDITOR='nvim'

ZSH_THEME="af-magic"

plugins=(
	git
	zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# Alias
alias v="nvim"
alias rm="rm -i"

# binding
bindkey -s ^f "~/.local/scripts/tmux-sessionizer\n"

# ################## NVM ####################
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bootdev
export PATH="$PATH:$HOME/go/bin"

