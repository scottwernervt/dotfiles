#!/bin/zsh
# shellcheck shell=bash

export GOPATH="$HOME/.go"
export NVM_DIR="$HOME/.nvm"
export PYENV_ROOT="$HOME/.pyenv"

typeset -U PATH path
path=(
    "$PYENV_ROOT/bin"
    "$GOPATH/bin"
    "/usr/local/bin"
    "$HOME/.local/bin"
    "$HOME/bin"
    "${path[@]}"
)
export PATH

# Load local user environment variables
if [ -f "$HOME/.local_env" ]; then
    source "$HOME/.local_env"
fi


# Prevent duplicate output of python virtualenv
# https://github.com/spaceship-prompt/spaceship-prompt/issues/19#issuecomment-345917827
export VIRTUAL_ENV_DISABLE_PROMPT=true
