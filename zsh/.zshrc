# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/francesco/.oh-my-zsh"
export DISABLE_AUTO_TITLE='true'

ZSH_THEME="af-magic"

plugins=(
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Alias
alias vim="nvim"
alias portale="cd ~/Projects/Work/portale-b2c/"
alias pro="cd ~/Projects/Work/contexts/repos/spiagge-pro/"

export PATH="/usr/local/opt/node@12/bin:$PATH"

# GO
export GOPATH=/user/local/go
export GOBIN=$GOPATH/bin
export PATH="$PATH:$GOBIN"

# ################## NVM ####################
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc
# ################## NVM ####################

# FLUTTER
export PATH="$PATH:/Users/francesco/Utils/flutter/bin:/Users/francesco/Library/Android/sdk/tools/bin"

# OPENVPN
export PATH="$PATH:/usr/local/opt/openvpn/sbin"

export PATH="$PATH:/Users/francesco/Projects/Personal/dotfiles/scripts/cht.sh"

# binding
bindkey -s ^f "~/Projects/Personal/dotfiles/scripts/tmux-sessionizer\n"

source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
