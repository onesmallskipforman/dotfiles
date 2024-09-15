# Skipper's .zshenv

# Designate Tools
export TERMINAL="alacritty"
export BROWSER="firefox"
export EDITOR="nvim"

# set xdg env variables
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"

# set other directories
# ~/ Clean-up:
[ $(uname) = "Darwin" ] && {
    export DOCKER_HOST="unix://$XDG_CONFIG_HOME/colima/docker.sock"
    export HOMEBREW_CASK_OPTS="--no-quarantine"
}
export DOCKER_CONFIG=$XDG_CONFIG_HOME/docker
export IPYTHONDIR=$XDG_CONFIG_HOME/jupyter
export JUPYTER_CONFIG_DIR=$XDG_CONFIG_HOME/jupyter
export LESSHISTFILE="-"
export CALCHISTFILE="$XDG_CACHE_HOME"/calc_history
export PARALLEL_HOME=$XDG_CONFIG_HOME/parallel
export GNUPGHOME=$XDG_DATA_HOME/gnupg
export PASSWORD_STORE_DIR=$XDG_DATA_HOME/pass
export PLATFORMIO_CORE_DIR=$XDG_DATA_HOME/platformio
export PYLINTHOME=$XDG_CACHE_HOME/pylint
export CARGO_HOME=$XDG_DATA_HOME/cargo
export RUSTUP_HOME=$XDG_DATA_HOME/rustup
export PATH="$CARGO_HOME/bin:$PATH"
export GOPATH=$XDG_DATA_HOME/go
export PATH=$PATH:/usr/local/go/bin
export XINITRC=$XDG_CONFIG_HOME/x11/xinitrc
[ $(uname) = "Darwin" ] \
    && export XAUTHORITY=$XDG_CACHE_HOME/Xauthority \
    || export XAUTHORITY=$XDG_RUNTIME_DIR/Xauthority
export ZDOTDIR=$XDG_CONFIG_HOME/zsh
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history
export NVM_DIR="$XDG_DATA_HOME"/nvm
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc

# ncurses
export TERMINFO="$XDG_DATA_HOME"/terminfo
export TERMINFO_DIRS="$XDG_DATA_HOME"/terminfo:/usr/share/terminfo

# Set Path Variables
# export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export MANPATH="$HOME/.local/share/man:$MANPATH"
export PATH="$PATH:$HOME/.local/share/python/bin"

# paths for coreutils on macos
[ $(uname) = "Darwin" ] && {
    export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
    export PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
    export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
    export PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"
    export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
}

# TODO: split up env and rc files to add and remove with pkg installation
# TeXLive
export TEXMFHOME=$XDG_DATA_HOME/texmf
export TEXMFVAR=$XDG_CACHE_HOME/texlive/texmf-var
export TEXMFCONFIG=$XDG_CONFIG_HOME/texlive/texmf-config
export MANPATH=$MANPATH:$HOME/.local/texlive/texmf-dist/doc/man
export INFOPATH=$INFOPATH:$HOME/.local/texlive/texmf-dist/doc/info
[ $(uname) = "Darwin" ] \
    && export PATH=$PATH:$HOME/.local/texlive/bin/universal-darwin \
    || export PATH=$PATH:$HOME/.local/texlive/bin/x86_64-linux

# configure fzf
export FZF_DEFAULT_COMMAND='rg -uu -g "!*.{git,DS_Store}" --files'


# TODO: create workbin folder and add to $PATH
# this should be all sxhkd needs
export PATH="$PATH:$XDG_CONFIG_HOME/work"

# NOTE: this is to sxhkd can see work aliases.
# might want to see if there's another way
[ -f ~/.config/work/workrc ] && source ~/.config/work/workrc


export PYTHONDONTWRITEBYTECODE=1
export PYTHON_HISTORY=$XDG_STATE_HOME/python/history
export PYTHONPYCACHEPREFIX=$XDG_CACHE_HOME/python
export PYTHONUSERBASE=$XDG_DATA_HOME/python



[ $(uname) = "Darwin" ] && export PATH="/usr/local/opt/node@20/bin:$PATH"

# Add path for using LSPs installed by mason
export PATH="$XDG_DATA_HOME/nvim/mason/bin:$PATH"


GUIX_PROFILE="$HOME/.guix-profile"
[ -f "$GUIX_PROFILE/etc/profile" ] && source "$GUIX_PROFILE/etc/profile"
