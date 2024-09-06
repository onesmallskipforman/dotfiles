# Skipper's .zshenv

# Designate Tools
export TERMINAL="alacritty"
export BROWSER="firefox"
export EDITOR="nvim"

# set xdg env variables
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

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
export PARALLEL_HOME=$XDG_CONFIG_HOME/parallel
export GNUPGHOME=$XDG_DATA_HOME/gnupg
export PASSWORD_STORE_DIR=$XDG_DATA_HOME/pass
export PLATFORMIO_CORE_DIR=$XDG_DATA_HOME/platformio
export PYLINTHOME=$XDG_CACHE_HOME/pylint
export CARGO_HOME=$XDG_DATA_HOME/cargo
export RUSTUP_HOME=$XDG_DATA_HOME/rustup
export PATH="$CARGO_HOME/bin:$PATH"
export XINITRC=$XDG_CONFIG_HOME/x11/xinitrc
export XAUTHORITY=$XDG_RUNTIME_DIR/Xauthority
export ZDOTDIR=$XDG_CONFIG_HOME/zsh

# Set Path Variables
# export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export MANPATH="$HOME/.local/share/man:$MANPATH"

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



[ $(uname) = "Darwin" ] && export PATH="/usr/local/opt/node@20/bin:$PATH"

# Add path for using LSPs installed by mason
export PATH="$XDG_DATA_HOME/nvim/mason/bin:$PATH"
export PATH=$PATH:/usr/local/go/bin


GUIX_PROFILE="$HOME/.guix-profile"
[ -f "$GUIX_PROFILE/etc/profile" ] && source "$GUIX_PROFILE/etc/profile"
