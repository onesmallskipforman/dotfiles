# Skipper's .zshrc

#===============================================================================
# PROMPT
#===============================================================================

# prompt management
autoload -U colors && colors
# export PS1="[ %n %1~ ] ❯ "
# export PS1="%B%{$fg[red]%}$PS1 %{$reset_color%}"
export PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%1~%{$fg[red]%}]%{$reset_color%}$%b "

#===============================================================================
# COMPLETIONS
#===============================================================================

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history
mkdir -p ~/.cache/zsh

# search history matching up to cursor
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

# set cache directory
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.cache/zsh/.zcompcache

# Basic auto/tab complete:
autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit -d ~/.cache/zsh/.zcompdump
_comp_options+=(globdots)   # Include hidden files.

# Auto complete with case insenstivity
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

#===============================================================================
# KEYMAPPINGS
#===============================================================================

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}; zle -N zle-keymap-select

# Fix backspace bug when switching modes
bindkey "^?" backward-delete-char

# append session history list to the history file, rather than replace it
setopt APPEND_HISTORY

function zle-line-init() {
    # initiate `vi insert` as keymap
    # (can be removed if `bindkey -v` has been set elsewhere)
    zle -K viins
    echo -ne "\e[5 q"
}; zle -N zle-line-init

echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

function vi-yank-xclip {
    zle vi-yank
    print -rn -- "$CUTBUFFER" | {
        [ $(uname) = "Darwin" ] && pbcopy -i || {
            [ ! -z $WAYLAND_DISPLAY ] && wl-copy \
                || xclip -i -selection 'clipboard'
        }
    }
}; zle -N vi-yank-xclip
bindkey -M vicmd 'y' vi-yank-xclip

# # Use lf to switch directories and bind it to ctrl-o
# lfcd () {
#     tmp="$(mktemp)"
#     lf -last-dir-path="$tmp" "$@"
#     if [ -f "$tmp" ]; then
#         dir="$(cat "$tmp")"
#         rm -f "$tmp"
#         [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
#     fi
# }
# bindkey -s '^o' 'lfcd\n'

#===============================================================================
# SOURCING FEATURES
#===============================================================================

function checkEx(){{ command -v $1 || echo /dev/null } | xargs -I{} [ -x {} ];}
function sourceSrc() { [ -f "$1" ] && source "$1"; }
function setupRos() { source /opt/ros/$1/setup.zsh }

# Load zsh-syntax-highlighting, zsh-autosuggestions; should be last.
[ $(uname) = "Darwin" ] && DATADIR="/usr/local/share" || {
    [ $(lsb_release -i | awk -F ':[[:space:]]' '{print $2}') = "Ubuntu" ] \
        && DATADIR="/usr/share" || DATADIR="/usr/share/zsh/plugins"
}
source $DATADIR/zsh-autosuggestions/zsh-autosuggestions.zsh
source $DATADIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source $DATADIR/autojump/autojump.zsh

source $XDG_CONFIG_HOME/shell/aliasrc

# completions
# i thought of this and i cant believe this works lmao
# TODO:seems to reduce time command result but feels like
# the same speed. i suspect the background processes don't
# go into the final time calculation
# PIPX_COMPLETIONS=$(mktemp -u); mkfifo $PIPX_COMPLETIONS
# FZFZ_COMPLETIONS=$(mktemp -u); mkfifo $FZFZ_COMPLETIONS
# (register-python-argcomplete pipx > $PIPX_COMPLETIONS &)
# (fzf --zsh                        > $FZFZ_COMPLETIONS &)
# source <(cat $PIPX_COMPLETIONS)
# source <(cat $FZFZ_COMPLETIONS)
eval "$(register-python-argcomplete pipx)"
source <(fzf --zsh)
source /etc/profile.d/nix-daemon.sh

#===============================================================================
# PROCESS INITIAL COMMANDS
#===============================================================================

# showoff
# {
    # clear;
    # checkEx fastfetch && fastfetch;
    # checkEx figlet \
    #     && figlet -d $HOME/.local/src/figlet-fonts -w 150 -f Roman 'Z-shell' \
    #     && echo -e '\e[2A\e[K'
# }

# run provided command
# [[ $1 == eval ]] && {"$@"; set --}

# TODO: move work functions to a scripts folder
# i suspect you lose a lot more time up front having zsh load all your functions.
# if you use scripts instead, i think exploring the search path and not loading every script would be faster,
# even if you need a subshell to execute the script
WORKRC=$HOME/.config/work/workrc
[ -f $WORKRC ] && source $WORKRC

function gd() {
    local DIR=$(
        {find ~/work/git -maxdepth 3 -type d -name ".git"
         find ~/Projects -maxdepth 5 -name ".git"} \
            | xargs -n1 dirname \
            | fzf --cycle --height ${FZF_TMUX_HEIGHT:-40%} --layout reverse
    )
    cd $DIR
}

# jira completion zsh | sudo tee "/usr/local/share/zsh/site-functions/_jira"
