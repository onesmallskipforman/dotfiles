" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')
  Plug 'morhetz/gruvbox'                              " gruvbox color scheme
  Plug 'patstockwell/vim-monokai-tasty'               " subl monokai color scheme
  Plug 'junegunn/goyo.vim'                            " distraction-free mode
  " Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
  Plug 'preservim/nerdtree'                           " alternative file tree
  " Plug 'lambdalisue/fern.vim'
  Plug 'ryanoasis/vim-devicons'                       " Icon Pack (for nerdtree and startify
  Plug 'kyazdani42/nvim-web-devicons'                 " Icon Pack (lua rewrite, for barbar)
  Plug 'romgrk/barbar.nvim'                           " Tabline Plugin
  Plug 'sheerun/vim-polyglot'                         " syntax highlight pack
  Plug 'junegunn/fzf', {'do':{-> fzf#install()}}      " install latest fzf
  Plug 'junegunn/fzf.vim'                             " fzf support
  Plug 'mhinz/vim-startify'                           " fancy start screen
  Plug 'luochen1990/rainbow'                          " color brackets
  Plug 'metakirby5/codi.vim'                          " scratchpad
  Plug 'honza/vim-snippets'                           " snippets collection
  Plug 'tpope/vim-commentary'                         " comment stuff out
  Plug 'voldikss/vim-floaterm'                        " floating terminal
  Plug 'yuttie/comfortable-motion.vim'                " inertial scrolling
  Plug 'mg979/vim-visual-multi', {'branch': 'master'} " multiple cursors
  Plug 'junegunn/vim-easy-align'                  " align stuff
  " Plug 'junegunn/limelight.vim'                   " Hyperfocus on a range
  " Plug 'tiagofumo/vim-nerdtree-syntax-highlight'  " Nerdtree highlight - SLOW
  " Plug 'TaDaa/vimade'                             " fade inactive buffers - SLOW
  " Plug 'dylanaraps/wal.vim'                       " pywal color scheme
  " Plug 'Yggdroot/indentLine'                          " show indentation marks
  " Plug 'lukas-reineke/indent-blankline.nvim'          " empty line indent mark
call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
