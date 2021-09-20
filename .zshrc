#!/bin/zsh
# shellcheck shell=bash
#
# Apple Shortcuts: Swap Control and Super for Code Keyboard 110 v2
#
# Set globally:
#   localectl --no-convert set-x11-keymap us pc105 "" ctrl:swap_lwin_lctl,ctrl:swap_rwin_rctl
#   cat /etc/X11/xorg.conf.d/00-keyboard.conf
#
# Set for current session:
#    setxkbmap -option ctrl:swap_lwin_lctl -option ctrl:swap_rwin_rctl
# 
# Reset for current session:
#    setxkbmap -option
#
# Reference:
#   https://gist.github.com/rbreaves/f4cf8a991eaeea893999964f5e83eebb
#   https://wiki.archlinux.org/index.php/Xorg/Keyboard_configuration#Using_X_configuration_files
# 
# .zshenv   | read every time       | env vars that are updated frequently
# .zprofile | read at login         | env vars for that are NOT updated frequently
# .zshrc    | read when interactive | interactive usage
# .zlogin   | read at login         | read after .zshrc so shell is setup
# .zlogout  | read at logout        | clear your terminal or resource
# 
# References:
#   https://unix.stackexchange.com/a/487889

export ZSH=${ZSH:-$HOME/.oh-my-zsh}
export ZSH_CUSTOM=${ZSH_CUSTOM:-$ZSH/custom}

# Theme
# https://denysdovhan.com/spaceship-prompt/docs/Options.html
ZSH_THEME="spaceship"
SPACESHIP_PROMPT_ORDER=(
    user          # Username section
    host          # Hostname section
    dir           # Current directory section
    git           # Git section (git_branch + git_status)
    #hg            # Mercurial section (hg_branch  + hg_status)
    package       # Package version
    node          # Node.js section
    #ruby          # Ruby section
    #elixir        # Elixir section
    #xcode         # Xcode section
    #swift         # Swift section
    golang        # Go section
    #php           # PHP section
    #rust          # Rust section
    #haskell       # Haskell Stack section
    #julia         # Julia section
    docker        # Docker section
    aws           # Amazon Web Services section
    #venv          # virtualenv section
    conda         # conda virtualenv section
    pyenv         # Pyenv section
    dotnet        # .NET section
    ember         # Ember.js section
    kubectl       # Kubectl context section
    terraform     # Terraform workspace section
    line_sep      # Line break
    #battery       # Battery level and status
    vi_mode       # Vi-mode indicator
    char          # Prompt character
)
# SPACESHIP_RPROMPT_ORDER=(
#     rprompt_prefix  # force items on same line as left prompt
#     exit_code       # Exit code section
#     exec_time       # Execution time
#     jobs            # Background jobs indicator
#     time            # Time stamps section
#     rprompt_suffix  # force items on same line as left prompt
# )

# DEFAULT_PREFIX=": "
# DEFAULT_CHAR_COLOR=black 
SPACESHIP_CHAR_SUFFIX=" "
SPACESHIP_CHAR_SYMBOL=">"
SPACESHIP_CHAR_SYMBOL_ROOT="#"
SPACESHIP_DIR_COLOR=blue
# SPACESHIP_DIR_PREFIX=$DEFAULT_PREFIX
SPACESHIP_DIR_TRUNC=0
SPACESHIP_DIR_TRUNC_REPO=false
# SPACESHIP_EXEC_TIME_COLOR=white
# SPACESHIP_EXIT_CODE_SHOW=true
# SPACESHIP_GIT_PREFIX=$DEFAULT_PREFIX
SPACESHIP_HOST_COLOR=black
SPACESHIP_HOST_COLOR_SSH=magenta
# SPACESHIP_HOST_SHOW=always
# SPACESHIP_HOST_SHOW_FULL=true
# SPACESHIP_HOST_PREFIX="@"
# SPACESHIP_TIME_COLOR=black
# SPACESHIP_TIME_PREFIX=""
# SPACESHIP_TIME_SHOW=true
# SPACESHIP_USER_COLOR=black
# SPACESHIP_USER_PREFIX=""
# SPACESHIP_USER_SUFFIX=""
# SPACESHIP_USER_SHOW=always
# SPACESHIP_CHAR_COLOR_SUCCESS=$DEFAULT_CHAR_COLOR
# SPACESHIP_CHAR_COLOR_FAILURE=$DEFAULT_CHAR_COLOR

# Workaround to support left and right prompts
# https://github.com/denysdovhan/spaceship-prompt/issues/558#issuecomment-451918947
spaceship_rprompt_prefix() {
  echo -n '%{'$'\e[1A''%}'
}
spaceship_rprompt_suffix() {
  echo -n '%{'$'\e[1B''%}'
}

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# History file configuration
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=10000
HIST_STAMPS="yyyy-mm-dd"

setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt inc_append_history     # add commands to HISTFILE in order of execution
setopt share_history          # share command history data

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(
    colored-man-pages
    docker
    git
    jsontools
    node
    nvm
    pip
    pyenv
    safe-paste
    ssh-agent
    sudo
    vscode
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source "${ZSH}/oh-my-zsh.sh"

# User configuration
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export BROWSER=firefox
export ANDROID_HOME=/opt/android-sdk
# export _JAVA_AWT_WM_NONREPARENTING=1
# export MANPATH="/usr/local/man:$MANPATH"

# Preferred editor for local and remote sessions
export VISUAL=vi
export EDITOR="$VISUAL"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Help message for shell scripts
# https://samizdat.dev/help-message-for-shell-scripts/
help() {
    sed -rn 's/^### ?//;T;p' "$0"
}

# Query command cheatsheet at cht.sh
# > cheat tar
function cheat() {
    curl cht.sh/"$1"
}

# Renaming files with mv without typing the name two times 
# https://gist.github.com/premek/6e70446cfc913d3c929d7cdbfe896fef
function mv() {
  if [ "$#" -ne 1 ] || [ ! -f "$1" ]; then
    command mv "$@"
    return
  fi

  newfilename="$1"
  vared newfilename
  command mv -v -- "$1" "$newfilename"
}

# Load shared and local user aliases
for alias_path in "$HOME/.aliases" "$HOME/.local_aliases"; do
    if [ -f $alias_path ]; then
        source $alias_path
    fi
done

# Enable auto-activation of pyenv virtualenvs
# https://github.com/pyenv/pyenv-virtualenv#installing-as-a-pyenv-plugin
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)" 
fi

# Automatically load node version found in .nvmrc
# https://github.com/nvm-sh/nvm#zsh
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [[ "$node_version" != "$(nvm version default)" ]]; then
    nvm use default --silent
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

