# Skipper's .zshenv

# Path Variables
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:/usr/local/sbin"
export PATH="$PATH:/Library/TeX/texbin"

# set xdg env variables
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# ~/ Clean-up:
export CARGO_HOME="$XDG_DATA_HOME"/cargo                     # Rust Cargo
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup                   # Rustup
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker               # docker
export MACHINE_STORAGE_PATH="$XDG_DATA_HOME"/docker-machine  # docker-machine
# export GNUPGHOME="$XDG_CONFIG_HOME/gnupg"                    # gnupg
export GNUPGHOME="$XDG_DATA_HOME/gnupg"                      # gnupg
export HOMEBREW_BUNDLE_FILE="$XDG_CONFIG_HOME/brew/brewfile" # homebrew
export IPYTHONDIR="$XDG_CONFIG_HOME"/jupyter                 # ipython
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter         # jupyter
export LESSHISTFILE="-"                                      # less history
export PARALLEL_HOME="$XDG_CONFIG_HOME"/parallel             # GNU parallel
export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass              # pass
# export PLATFORMIO_CORE_DIR="$XDG_CONFIG_HOME/platformio" # platformio
export PLATFORMIO_CORE_DIR="$XDG_DATA_HOME/platformio"       # platformio
export PYLINTHOME="$XDG_CACHE_HOME/pylint"                   # pylint
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME"/bundle         # ruby bundling
export BUNDLE_USER_CACHE="$XDG_CACHE_HOME"/bundle
export BUNDLE_USER_PLUGIN="$XDG_DATA_HOME"/bundle
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority              # xquarts/x11 (not working atm)
# export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"                 # wget (don't use unless you have actual wgetrc)
export ZDOTDIR="$HOME/.config/zsh"                           # zsh

# other
export EDITOR="/usr/local/bin/nvim"
export BACKUP="$HOME/Dropbox/Backup"
