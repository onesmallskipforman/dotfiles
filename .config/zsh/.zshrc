# Skipper's .zshrc

# Dependancies You Need for this Config
# zsh-syntax-highlighting - syntax highlighting for ZSH in standard repos
# autojump - jump to directories with j or jc for child or jo to open in file manager
# zsh-autosuggestions - Suggestions based on your history

# path vars for coreutils
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
export EDITOR="nvim"

# rust env setup
export PATH="/Users/skipper/.local/share/cargo/bin:$PATH"
# source $CARGO_HOME/env

# ROS
[ -f /opt/ros/kinetic/setup.zsh ] && source /opt/ros/kinetic/setup.zsh

#===============================================================================
# PROCESS INITIAL COMMAND
#===============================================================================

if [[ $1 == eval ]]
then
    "$@"
set --
fi

function kssh() {
  [ "$TERM" = "xterm-kitty" ] && kitty +kitten ssh $@ || ssh $@
}

#===============================================================================
# ALIASES, SHORTCUTS, INPUTS
#===============================================================================

# aliases
# [ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"
alias icat="kitty +kitten icat"
alias wget='wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"'
alias ssh='kssh'
alias docker='docker info &> /dev/null || {docker_setup && eval $(docker-machine env default)} && docker'
alias code='vscodeplugs; code'
alias subl='pkgctrl_install; subl'
alias quartus='/opt/altera/15.0/quartus/bin/quartus --64bin &>/dev/null & disown'
alias modelsim='/opt/altera/15.0/modelsim_ase/linuxaloem/vsim &>/dev/null & disown'

#===============================================================================
# PROMPT
#===============================================================================

# # Load version control information
# autoload -Uz vcs_info
# precmd () { vcs_info }

# # Format the vcs_info_msg_0_ variable
# zstyle ':vcs_info:git:*' formats ' - %b'

# # allow for prompt variable substitution
# setopt prompt_subst
# export PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%1~\$vcs_info_msg_0_%{$fg[red]%}]%{$reset_color%}$%b "

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

if [ "$OSTYPE" = "linux-gnu" ]; then
  export HISTFILE="$XDG_DATA_HOME/zsh/history_ubuntu"
else
  export HISTFILE="$XDG_DATA_HOME/zsh/history_osx"
fi


# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
mkdir -p "$XDG_CACHE_HOME/zsh" && rm -f "$XDG_CONFIG_HOME/zsh/.zcompdump"
compinit -d "$XDG_CACHE_HOME/zsh/.zcompdump"

# Include hidden files in autocomplete:
_comp_options+=(globdots)

#===============================================================================
# VIM MODE
#===============================================================================

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

#===============================================================================
# KEYMAPPINGS
#===============================================================================

# # Change cursor shape for different vi modes.
# function zle-keymap-select {
#   if [[ ${KEYMAP} == vicmd ]] ||
#      [[ $1 = 'block' ]]; then
#     echo -ne '\e[1 q'

#   elif [[ ${KEYMAP} == main ]] ||
#        [[ ${KEYMAP} == viins ]] ||
#        [[ ${KEYMAP} = '' ]] ||
#        [[ $1 = 'beam' ]]; then
#     echo -ne '\e[5 q'
#   fi
# }
# zle -N zle-keymap-select

# zle-line-init() {
#     zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
#     echo -ne "\e[5 q"
# }
# zle -N zle-line-init

# # Use beam shape cursor on startup.
# echo -ne '\e[5 q'
# # Use beam shape cursor for each new prompt.
# preexec() { echo -ne '\e[5 q' ;}

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

# turn CTRL+z into a toggle switch (buggy atm)
# ctrlz() {
#   if [[ $#BUFFER == 0 ]]; then
#     fg >/dev/null 2>&1 && zle redisplay
#   else
#     zle push-input
#   fi
# }
# zle -N ctrlz
# bindkey '^z' ctrlz

#===============================================================================
# LOAD EXTENSIONS
#===============================================================================

# Load zsh-syntax-highlighting, zsh-autosuggestions; should be last.
if [ "$OSTYPE" = "linux-gnu" ]; then
  source $HOME/.local/src/zsh-autosuggestions/zsh-autosuggestions.zsh
  source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  source /usr/share/autojump/autojump.zsh
else
  source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  source /usr/local/share/autojump/autojump.zsh
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
