#!/bin/zsh
# shellcheck shell=bash

export PYENV_ROOT=$HOME/.pyenv
export NODENV_ROOT=$HOME/.nodenv

typeset -U PATH path
path=(
    "$PYENV_ROOT/bin"
    "$NODENV_ROOT/shims"
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
