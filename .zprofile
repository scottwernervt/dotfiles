#!/bin/zsh
# shellcheck shell=bash

if dircolors_path="$(type -p "dircolors")" || [[ -z $dircolors_path ]]; then
    eval $(dircolors -b $HOME/.dircolors) || eval $(dircolors -b)
fi

[ "$XDG_CURRENT_DESKTOP" = "KDE" ] || [ "$XDG_CURRENT_DESKTOP" = "GNOME" ] || export QT_QPA_PLATFORMTHEME="qt5ct"
