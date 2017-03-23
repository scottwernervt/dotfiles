#!/bin/sh
userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# Qt 5 Theme
export QT_STYLE_OVERRIDE=GTK+

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Java: Non-reparenting window managers user should set the following environment variable
# export _JAVA_AWT_WM_NONREPARENTING=1

# If you do not use a desktop environment, add the folliwing
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# Start i3 window manager
exec i3 -V >> ~/.config/i3/logs/i3log-$(date +'%F-%k-%M-%S') 2>&1

# Set desktop background: https://wiki.archlinux.org/index.php/Feh
sh ~/scripts/fehbg &

# Nemo settings
gsettings set org.nemo.desktop show-desktop-icons false
gsettings set org.cinnamon.desktop.default-applications.terminal exec i3-sensible-terminal
