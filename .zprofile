#!/bin/zsh
# shellcheck shell=bash

[ -e $HOME/.dircolors ] && eval $(dircolors -b $HOME/.dircolors) || eval $(dircolors -b)
[ "$XDG_CURRENT_DESKTOP" = "KDE" ] || [ "$XDG_CURRENT_DESKTOP" = "GNOME" ] || export QT_QPA_PLATFORMTHEME="qt5ct"
