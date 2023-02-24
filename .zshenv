#!/bin/zsh
# shellcheck shell=bash

export GOPATH="$HOME/.go"
export NVM_DIR="$HOME/.nvm"
export PYENV_ROOT="$HOME/.pyenv"
export JETBRAIN_TOOLBOX="$HOME/.local/share/JetBrains/Toolbox/scripts"

typeset -U PATH path
path=(
    "$PYENV_ROOT/bin"
    "$GOPATH/bin"
    "$JETBRAIN_TOOLBOX"
    "/usr/local/bin"
    "$HOME/.local/bin"
    "$HOME/bin"
    "${path[@]}"
)
export PATH

# Load local user environment variables
if [ -f "$HOME/.zshenv_local" ]; then
    source "$HOME/.zshenv_local"
fi

# Prevent duplicate output of python virtualenv
# https://github.com/spaceship-prompt/spaceship-prompt/issues/19#issuecomment-345917827
export VIRTUAL_ENV_DISABLE_PROMPT=true
