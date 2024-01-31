# Setup fzf
# ---------
if [[ ! "$PATH" == *$HOME/.local/src/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}$HOME/.local/src/fzf/bin"
fi

# Auto-completion
# ---------------
source "$HOME/src/fzf/shell/completion.zsh"

# Key bindings
# ------------
source "$HOME/.local/src/fzf/shell/key-bindings.zsh"
