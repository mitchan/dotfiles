# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export DISABLE_AUTO_TITLE='true'
export EDITOR='nvim'

ZSH_THEME="af-magic"

plugins=(
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Alias
alias cd="z"
alias v="nvim"
alias rm="rm -i"

# binding
bindkey -s ^f "~/.local/scripts/tmux-sessionizer\n"

# ################## NVM ####################
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# zoxide
eval "$(zoxide init zsh)"

# bootdev
export PATH="$PATH:$HOME/go/bin"

