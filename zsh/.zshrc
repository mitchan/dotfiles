# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/francesco/.oh-my-zsh"
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
alias lzd="lazydocker"
alias v="nvim"

export PATH="/usr/local/opt/node@12/bin:$PATH"

# GO
# export GOPATH=/user/local/go
# export GOBIN=$GOPATH/bin
# export PATH="$PATH:$GOBIN"

# ################## NVM ####################
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# place this after nvm initialization!
# autoload -U add-zsh-hook
# load-nvmrc() {
#   local node_version="$(nvm version)"
#   local nvmrc_path="$(nvm_find_nvmrc)"
#
#   if [ -n "$nvmrc_path" ]; then
#     local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")
#
#     if [ "$nvmrc_node_version" = "N/A" ]; then
#       nvm install
#     elif [ "$nvmrc_node_version" != "$node_version" ]; then
#       nvm use
#     fi
#   elif [ "$node_version" != "$(nvm version default)" ]; then
#     echo "Reverting to nvm default version"
#     nvm use default
#   fi
# }
# add-zsh-hook chpwd load-nvmrc
# load-nvmrc
# ################## NVM ####################

# FLUTTER
export PATH="$PATH:/Users/francesco/Utils/flutter/bin:/Users/francesco/Library/Android/sdk/tools/bin"

# OPENVPN
export PATH="$PATH:/usr/local/opt/openvpn/sbin"

export PATH="$PATH:/Users/francesco/Projects/Personal/dotfiles/scripts/cht.sh"

# binding
bindkey -s ^f "~/.local/scripts/tmux-sessionizer\n"

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# goenv
# export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init -)"
export PATH="$GOROOT/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"

# zoxide
eval "$(zoxide init zsh)"
