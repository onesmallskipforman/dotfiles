# Skipper's .zshenv

# Designate Tools
export TERMINAL="alacritty"
export BROWSER="firefox"
export EDITOR="nvim"
export XWM="bspwm" # window manager when using X windowing system

# set xdg env variables
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# TODO: split up env and rc files to add and remove with pkg installation
# TeXLive
export TEXMFHOME=$XDG_DATA_HOME/texmf
export TEXMFVAR=$XDG_CACHE_HOME/texlive/texmf-var
export TEXMFCONFIG=$XDG_CONFIG_HOME/texlive/texmf-config
export MANPATH=$MANPATH:$HOME/.local/texlive/texmf-dist/doc/man
export INFOPATH=$INFOPATH:$HOME/.local/texlive/texmf-dist/doc/info
export PATH=$HOME/.local/texlive/bin/x86_64-linux:$PATH
export PATH=$HOME/.local/texlive/bin/universal-darwin:$PATH

# Set Path Variables
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:/usr/local/sbin"
export PATH="/Users/skipper/.local/share/cargo/bin:$PATH"
export PATH="/Users/skipper/Library/Python/3.11/bin:$PATH"

# paths for coreutils on macos
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$HOME/.local/share/man:$MANPATH"

# ~/ Clean-up:
export CARGO_HOME=$XDG_DATA_HOME/cargo                    # Rust Cargo
export DOCKER_CONFIG=$XDG_CONFIG_HOME/docker              # docker
export GNUPGHOME=$XDG_DATA_HOME/gnupg                     # gnupg
export HOMEBREW_CASK_OPTS="--no-quarantine"               # homebrew
export IPYTHONDIR=$XDG_CONFIG_HOME/jupyter                # ipython
export JUPYTER_CONFIG_DIR=$XDG_CONFIG_HOME/jupyter        # jupyter
export LESSHISTFILE="-"                                   # less history
export MACHINE_STORAGE_PATH=$XDG_DATA_HOME/docker-machine # docker-machine
export PARALLEL_HOME=$XDG_CONFIG_HOME/parallel            # GNU parallel
export PASSWORD_STORE_DIR=$XDG_DATA_HOME/pass             # pass
export PLATFORMIO_CORE_DIR=$XDG_DATA_HOME/platformio      # platformio
export PYLINTHOME=$XDG_CACHE_HOME/pylint                  # pylint
export RUSTUP_HOME=$XDG_DATA_HOME/rustup                  # Rustup
export XINITRC=$XDG_CONFIG_HOME/x11/xinitrc               # Xorg
export XAUTHORITY=$XDG_RUNTIME_DIR/Xauthority             #
export ZDOTDIR=$XDG_CONFIG_HOME/zsh                       # zsh

# configure fzf
export FZF_DEFAULT_COMMAND='rg -uu -g "!*.{git,DS_Store}" --files'

# configure path for rust
export PATH="$CARGO_HOME/bin:$PATH"

export LF_ICONS="\
tw=:\
st=:\
ow=:\
dt=:\
di=:\
fi=:\
ln=:\
or=:\
ex=:\
*.c=:\
*.cc=:\
*.clj=:\
*.coffee=:\
*.cpp=:\
*.css=:\
*.d=:\
*.dart=:\
*.erl=:\
*.exs=:\
*.fs=:\
*.go=:\
*.h=:\
*.hh=:\
*.hpp=:\
*.hs=:\
*.html=:\
*.java=:\
*.jl=:\
*.js=:\
*.json=:\
*.lua=:\
*.md=:\
*.php=:\
*.pl=:\
*.pro=:\
*.py=:\
*.rb=:\
*.rs=:\
*.scala=:\
*.ts=:\
*.vim=:\
*.cmd=:\
*.ps1=:\
*.sh=:\
*.bash=:\
*.zsh=:\
*.fish=:\
*.tar=:\
*.tgz=:\
*.arc=:\
*.arj=:\
*.taz=:\
*.lha=:\
*.lz4=:\
*.lzh=:\
*.lzma=:\
*.tlz=:\
*.txz=:\
*.tzo=:\
*.t7z=:\
*.zip=:\
*.z=:\
*.dz=:\
*.gz=:\
*.lrz=:\
*.lz=:\
*.lzo=:\
*.xz=:\
*.zst=:\
*.tzst=:\
*.bz2=:\
*.bz=:\
*.tbz=:\
*.tbz2=:\
*.tz=:\
*.deb=:\
*.rpm=:\
*.jar=:\
*.war=:\
*.ear=:\
*.sar=:\
*.rar=:\
*.alz=:\
*.ace=:\
*.zoo=:\
*.cpio=:\
*.7z=:\
*.rz=:\
*.cab=:\
*.wim=:\
*.swm=:\
*.dwm=:\
*.esd=:\
*.jpg=:\
*.jpeg=:\
*.mjpg=:\
*.mjpeg=:\
*.gif=:\
*.bmp=:\
*.pbm=:\
*.pgm=:\
*.ppm=:\
*.tga=:\
*.xbm=:\
*.xpm=:\
*.tif=:\
*.tiff=:\
*.png=:\
*.svg=:\
*.svgz=:\
*.mng=:\
*.pcx=:\
*.mov=:\
*.mpg=:\
*.mpeg=:\
*.m2v=:\
*.mkv=:\
*.webm=:\
*.ogm=:\
*.mp4=:\
*.m4v=:\
*.mp4v=:\
*.vob=:\
*.qt=:\
*.nuv=:\
*.wmv=:\
*.asf=:\
*.rm=:\
*.rmvb=:\
*.flc=:\
*.avi=:\
*.fli=:\
*.flv=:\
*.gl=:\
*.dl=:\
*.xcf=:\
*.xwd=:\
*.yuv=:\
*.cgm=:\
*.emf=:\
*.ogv=:\
*.ogx=:\
*.aac=:\
*.au=:\
*.flac=:\
*.m4a=:\
*.mid=:\
*.midi=:\
*.mka=:\
*.mp3=:\
*.mpc=:\
*.ogg=:\
*.ra=:\
*.wav=:\
*.oga=:\
*.opus=:\
*.spx=:\
*.xspf=:\
*.pdf=:\
*.nix=:\
"

# . "/Users/skipper/.local/share/cargo/env"

# NOTE: this is to sxhkd can see work aliases.
# might want to see if there's another way
[ -f ~/.config/work/workrc ] && source ~/.config/work/workrc
