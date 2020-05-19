#!/bin/zsh
# shellcheck shell=bash

export PYENV_ROOT="$HOME/.pyenv"

typeset -U PATH path
path=("$PYENV_ROOT/bin" "$HOME/.local/bin" "$HOME/bin" "$path[@]")
export PATH
