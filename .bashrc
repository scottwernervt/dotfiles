# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# https://github.com/chriskempson/base16-shell
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# dircolors
# https://github.com/seebi/dircolors-solarized
eval `dircolors ~/build-repos/dircolors-solarized/dircolors.256dark`
export TERM=rxvt-unicode

# Color Command Prompt
# http://unix.stackexchange.com/a/124408/222247
# https://www.digitalocean.com/community/tutorials/how-to-customize-your-bash-prompt-on-a-linux-vps
# http://hopandfork.org/2017/05/29/my-bashrc.html
PS1='[\e[0;36m\]\u\e[0m\]@\h : \[\e[0;34m\]\w\[\e[0m\] : \[\e[0m\]\t\[\e[0m\]]\n\$ '

# Autocomplete when using sudo
complete -cf sudo

# Do not save history if space proceeds command
export HISTCONTROL=ignoreboth
export HISTSIZE=1000000

# Variables
export BROWSER=firefox
export VISUAL=nano
export EDITOR="$VISUAL"
export ANDROID_HOME=/opt/android-sdk
export _JAVA_AWT_WM_NONREPARENTING=1

# Alias
alias mv='mv -v'
alias rm='rm -v -I'
alias cp='cp -v'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias diff='diff --color=always'
alias lock='light-locker-command -l'
alias backup="~/tools/tinkerdev-backup.sh"
alias Chrome="chromium"

# Added by travis gem
[ -f /home/swerner/.travis/travis.sh ] && source /home/swerner/.travis/travis.sh

# Nemo settings
gsettings set org.nemo.desktop show-desktop-icons false
gsettings set org.cinnamon.desktop.default-applications.terminal exec i3-sensible-terminal
