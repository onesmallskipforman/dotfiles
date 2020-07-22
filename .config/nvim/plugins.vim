" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')
  Plug 'morhetz/gruvbox'                         " gruvbox color scheme
  Plug 'junegunn/vim-easy-align'                 " align stuff
  Plug 'patstockwell/vim-monokai-tasty'          " subl monokai color scheme
  Plug 'junegunn/goyo.vim'                       " distraction-free mode
  Plug 'itchyny/lightline.vim'                   " lightline statusbar
  Plug 'mengelbrecht/lightline-bufferline'       " bufferline for lightline
  Plug 'preservim/nerdtree'                      " alternative file tree
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " Nerdtree highlight
  Plug 'ryanoasis/vim-devicons'                  " Nerdtree Icons
  Plug 'tpope/vim-commentary'                    " comment stuff out
  Plug 'sheerun/vim-polyglot'                    " syntax highlight pack
  Plug 'luochen1990/rainbow'                     " color brackets
  Plug 'junegunn/limelight.vim'                  " Hyperfocus on a range
  Plug 'junegunn/fzf', {'do':{-> fzf#install()}} " install latest fzf
  Plug 'junegunn/fzf.vim'                        " fzf support
call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall | q
  \| endif
