#!/bin/zsh
# shellcheck shell=bash

echo "OS: ${OSTYPE}"
echo "Distro:" "$(uname)"
echo "Installing packages..."

# Linux packages
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    yay -S gron
fi

# OSX packages
if [[ "$OSTYPE" == "darwin"* ]]; then
    brew install bzip2 openssl readline sqlite3 xz zlib
    brew install gron
    brew install --cask keycastr
fi

# Common packages
git clone https://github.com/zsh-users/zsh-autosuggestions.git "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"

git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

curl https://pyenv.run | bash
git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

echo "Activating $HOME/.zshrc"
source "$HOME/.zshrc"
