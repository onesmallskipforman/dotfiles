# Setup fzf
# ---------
if [[ ! "$PATH" == */home/skipper/.local/src/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/skipper/.local/src/fzf/bin"
fi

# Auto-completion
# ---------------
source "/home/skipper/.local/src/fzf/shell/completion.bash"

# Key bindings
# ------------
source "/home/skipper/.local/src/fzf/shell/key-bindings.bash"
