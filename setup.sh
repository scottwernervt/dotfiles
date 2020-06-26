#!/bin/zsh
# shellcheck shell=bash

echo "OS: ${OSTYPE}"
echo "Distro:" "$(uname)"
echo "Installing packages..."

# Common packages
git clone https://github.com/zsh-users/zsh-autosuggestions.git "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"


# Linux packages
# if [[ "$OSTYPE" == "linux-gnu"* ]]; then
# fi

# OSX packages
# if [[ "$OSTYPE" == "darwin"* ]]; then
# fi


echo "Activating $HOME/.zshrc"
source "$HOME/.zshrc"
