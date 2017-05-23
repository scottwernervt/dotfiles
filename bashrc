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
PS1='[\e[0;36m\]\u\e[0m\]@\h : \[\e[0;34m\]\w\[\e[0m\] : \[\e[0m\]\t\[\e[0m\]]\n$ '

# Autocomplete when using sudo
complete -cf sudo

# Do not save history if space proceeds command
HISTCONTROL=ignorespace

# Alias
alias mv='mv -v'
alias rm='rm -v'
alias cp='cp -v'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias nemo='nemo --no-desktop'
alias Chrome="chromium"

# Lock screen
alias lock='light-locker-command -l'

# Build android apps from command line
export ANDROID_HOME=/opt/android-sdk

# Java: Non-reparenting window managers user should set the following environment variable
export _JAVA_AWT_WM_NONREPARENTING=1

# added by travis gem
[ -f /home/swerner/.travis/travis.sh ] && source /home/swerner/.travis/travis.sh
