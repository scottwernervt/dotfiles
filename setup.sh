#!/bin/zsh
# shellcheck shell=bash

echo "OS: ${OSTYPE}"
echo "Distro:" "$(uname)"
echo "Installing packages..."

# Common packages
git clone https://github.com/zsh-users/zsh-autosuggestions.git "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"

curl https://pyenv.run | bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash

# Linux packages
# if [[ "$OSTYPE" == "linux-gnu"* ]]; then
# fi

# OSX packages
# if [[ "$OSTYPE" == "darwin"* ]]; then
# fi

echo "Activating $HOME/.zshrc"
source "$HOME/.zshrc"
