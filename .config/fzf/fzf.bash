# Setup fzf
# ---------
if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  # export PATH="${PATH:+${PATH}:}/usr/local/opt/fzf/bin"
  PATH="${PATH:+${PATH}:}/usr/local/opt/fzf/bin"
fi

# Auto-completion
# ---------------
# [[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.bash" 2> /dev/null
source "/usr/local/opt/fzf/shell/completion.bash"

# Key bindings
# ------------
source "/usr/local/opt/fzf/shell/key-bindings.bash"
