#!/bin/zsh
# shellcheck shell=bash

# Enable auto-activation of pyenv
# https://github.com/pyenv/pyenv/#installation
# eval "$(pyenv init --path)"

if [ "$(tty)" = "/dev/tty1" ] ; then
    exec sway
fi
