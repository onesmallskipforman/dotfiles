# Skipper's .zshenv

# Path Variables
export PATH="$PATH:$HOME/.local/bin/"
export PATH="$PATH:/usr/local/sbin"
export PATH="$PATH:/Library/TeX/texbin"

# set xdg env variables
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# ~/ Clean-up:
export CARGO_HOME="$XDG_DATA_HOME"/cargo                    # Rust Cargo
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup                  # Rustup
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker              # docker
export MACHINE_STORAGE_PATH="$XDG_DATA_HOME"/docker-machine # docker-machine
# export GNUPGHOME="$XDG_CONFIG_HOME/gnupg"                # gnupg
export GNUPGHOME="$XDG_DATA_HOME/gnupg"                     # gnupg
export PACKAGES_FOLDER="$XDG_CONFIG_HOME/packages"          # packages
export HOMEBREW_BUNDLE_FILE="$PACKAGES_FOLDER/brewfile"
export IPYTHONDIR="$XDG_CONFIG_HOME"/jupyter                # ipython
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter        # jupyter
export LESSHISTFILE="-"                                     # less history
export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass             # pass
# export PLATFORMIO_CORE_DIR="$XDG_CONFIG_HOME/platformio" # platformio
export PLATFORMIO_CORE_DIR="$XDG_DATA_HOME/platformio"      # platformio
export PYLINTHOME="$XDG_CACHE_HOME/pylint"                  # pylint
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority             # xquarts/x11 (not working atm)
# export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"             # wget (don't use unless you have actual wgetrc)
export ZDOTDIR="$HOME/.config/zsh"                          # zsh

# other
export EDITOR="/usr/local/bin/vim"
export BACKUP="$HOME/Dropbox/Backup"
