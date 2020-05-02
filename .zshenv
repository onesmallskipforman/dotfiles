# Skipper's .zshenv

# Set Path Variables
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:/usr/local/sbin"
export PATH="$PATH:/Library/TeX/texbin"

# set xdg env variables
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# Designate Tools
export EDITOR="/usr/local/bin/nvim" # editor

# ~/ Clean-up:
export PKGDIR="$XDG_CONFIG_HOME/pakcages"
export APT_BUNDLE_FILE="$PKGDIR/aptfile"                    # apt
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME"/bundle         # ruby bundling
export BUNDLE_USER_CACHE="$XDG_CACHE_HOME"/bundle           #
export BUNDLE_USER_PLUGIN="$XDG_DATA_HOME"/bundle           #
export CARGO_HOME="$XDG_DATA_HOME"/cargo                    # Rust Cargo
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker              # docker
export GNUPGHOME="$XDG_DATA_HOME/gnupg"                     # gnupg
export HOMEBREW_BUNDLE_FILE="$PKGDIR/brewfile"              # homebrew bundling
export HOMEBREW_CASK_OPTS="--no-quarantine"                 #
export HOMEBREW_BUNDLE_NO_LOCK=1                            #
export IPYTHONDIR="$XDG_CONFIG_HOME"/jupyter                # ipython
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter        # jupyter
export LESSHISTFILE="-"                                     # less history
export MACHINE_STORAGE_PATH="$XDG_DATA_HOME"/docker-machine # docker-machine
export PARALLEL_HOME="$XDG_CONFIG_HOME"/parallel            # GNU parallel
export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass             # pass
export PLATFORMIO_CORE_DIR="$XDG_DATA_HOME/platformio"      # platformio
export PYLINTHOME="$XDG_CACHE_HOME/pylint"                  # pylint
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup                  # Rustup
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc               # Xorg
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority             #
export ZDOTDIR="$HOME/.config/zsh"                          # zsh
