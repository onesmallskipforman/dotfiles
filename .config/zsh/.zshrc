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

# set cache directory
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.cache/zsh/.zcompcache

# Basic auto/tab complete:
autoload -U compinit
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
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Fix backspace bug when switching modes
bindkey "^?" backward-delete-char

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

# Load zsh-syntax-highlighting, zsh-autosuggestions; should be last.
[ "$OSTYPE" = "linux-gnu" ] && DATADIR="/usr/share" || DATADIR="/usr/local/share"
source $DATADIR/zsh-autosuggestions/zsh-autosuggestions.zsh
source $DATADIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source $DATADIR/autojump/autojump.zsh

[ -f "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.zsh ] && source "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.zsh
[ -f "$XDG_CONFIG_HOME/aliasrc"     ] && source $XDG_CONFIG_HOME/aliasrc
[ -f /opt/ros/$ROS_DISTRO/setup.zsh ] && source /opt/ros/$ROS_DISTRO/setup.zsh

#===============================================================================
# PROCESS INITIAL COMMANDS
#===============================================================================

# showoff
{
    clear;
    [ -x "$(command -v fastfetch)" ] && fastfetch;
    [ -x "$(command -v figlet)" ] && figlet -d $HOME/.local/src/figlet-fonts -w 150 -f Roman 'Z-shell' && echo -e '\e[2A\e[K'
}

# run provided command
if [[ $1 == eval ]]; then "$@"; set --; fi # [[ $1 == eval ]] && ("$@"; set --)

WORKRC=~/.config/work/workrc
[ -f $WORKRC ] && source $WORKRC

export PYTHONDONTWRITEBYTECODE=1
# TODO: only add this on OSX
export PATH="/usr/local/opt/node@20/bin:$PATH"

# Add path for using LSPs installed by mason
export PATH="/home/skipper/.local/share/nvim/mason/bin:$PATH"
