#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export HISTFILE="$XDG_STATE_HOME"/bash/history
echo $HISTFILE | xargs dirname | xargs mkdir -p
alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
