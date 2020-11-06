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

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

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
if [ "$OSTYPE" = "linux-gnu" ]; then
  source $HOME/.local/src/zsh-autosuggestions/zsh-autosuggestions.zsh
  source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  # source /usr/share/autojump/autojump.zsh
else
  source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  # source /usr/local/share/autojump/autojump.zsh
fi

[ -f $XDG_CONFIG_HOME/fzf/fzf.zsh ] && source $XDG_CONFIG_HOME/fzf/fzf.zsh
[ -f /opt/ros/kinetic/setup.zsh   ] && source /opt/ros/kinetic/setup.zsh
[ -f "$XDG_CONFIG_HOME/aliasrc"   ] && source $XDG_CONFIG_HOME/aliasrc

#===============================================================================
# PROCESS INITIAL COMMANDS
#===============================================================================

# showoff
clear; neofetch; figlet -d $HOME/.local/src/figlet-fonts -w 150 -f Roman 'Z-shell'; echo -e '\e[2A\e[K'

# run provided command
if [[ $1 == eval ]]; then "$@"; set --; fi # [[ $1 == eval ]] && ("$@"; set --)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


source ~/.workrc

export PYTHONDONTWRITEBYTECODE=1
