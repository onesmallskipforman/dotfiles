" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')
  Plug 'morhetz/gruvbox'                          " gruvbox color scheme
  Plug 'patstockwell/vim-monokai-tasty'           " subl monokai color scheme
  Plug 'junegunn/goyo.vim'                        " distraction-free mode
  Plug 'itchyny/lightline.vim'                    " lightline statusbar
  Plug 'mengelbrecht/lightline-bufferline'        " bufferline for lightline
  Plug 'preservim/nerdtree'                       " alternative file tree
  Plug 'ryanoasis/vim-devicons'                   " Nerdtree Icons
  Plug 'sheerun/vim-polyglot'                     " syntax highlight pack
  Plug 'junegunn/fzf', {'do':{-> fzf#install()}}  " install latest fzf
  Plug 'junegunn/fzf.vim'                         " fzf support
  Plug 'mhinz/vim-startify'                       " fancy start screen
  Plug 'luochen1990/rainbow'                      " color brackets
  Plug 'metakirby5/codi.vim'                      " scratchpad
  Plug 'neoclide/coc.nvim', {'branch': 'release'} " completions
  Plug 'honza/vim-snippets'                       " snippets collection
  Plug 'tpope/vim-commentary'                     " comment stuff out


  " experimenting:



  " up next:


  " use lf in a floating terminal
  " Plug 'voldikss/vim-floaterm'                    " floating terminal
  " Plug 'junegunn/vim-easy-align'                  " align stuff
  " Plug 'tiagofumo/vim-nerdtree-syntax-highlight'  " Nerdtree highlight " SLOWS DOWN MOUSE OFF SCROLLING IN NERDTREE
  " Plug 'junegunn/limelight.vim'                   " Hyperfocus on a range
  " Plug 'TaDaa/vimade'                             " fade inactive buffers - SLOW


call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif