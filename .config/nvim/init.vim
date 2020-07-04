"==============================================================================
" Plugins
"==============================================================================
  call plug#begin('~/.config/nvim/plugged')
  " interface
  " ----------------------------------------------------------------------------
    " Plug 'vim-airline/vim-airline'                  " statusbar
    " Plug 'vim-airline/vim-airline-themes'           " airline statusbar themes
    Plug 'junegunn/goyo.vim'                        " distraction-free mode
    Plug 'itchyny/lightline.vim'                   " lightline statusbar
    Plug 'preservim/nerdtree'                      " alternative file tree
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " Nerdtree highlight
    Plug 'ryanoasis/vim-devicons'                  " Nerdtree Icons
    " Plug 'junegunn/limelight.vim'                  " Hyperfocus on a range
    " Plug 'voldikss/vim-floaterm'                   " floating builtin terminal
    " Plug 'terryma/vim-multiple-cursors' " sublime/vscode -like multiple selection
  " colorschemes
  " ----------------------------------------------------------------------------
    Plug 'chriskempson/base16-vim' " base16color pack
    Plug 'flazz/vim-colorschemes'  " color pack
    Plug 'morhetz/gruvbox'
    " Plug 'gruvbox-community/gruvbox'
    " Plug 'sainnhe/gruvbox-material'
    " Plug 'phanviet/vim-monokai-pro'
    " Plug 'tomasiser/vim-code-dark'
    " Plug 'sickill/vim-monokai'
    " Plug 'erichdongubler/vim-sublime-monokai'
    " Plug 'haya14busa/vim-keeppad'
    " Plug 'erichain/vim-monokai-pro'

  " git
  " ----------------------------------------------------------------------------
    " Plug 'jreybert/vimagit'       " git workflow in vim
    " Plug 'tpope/vim-fugitive'     " git workflow in vim
    " Plug 'airblade/vim-gitgutter' " git gutter info

  " language support
  " ----------------------------------------------------------------------------
    " Plug 'neoclide/coc.nvim', {'branch': 'release'} " coc
    Plug 'sheerun/vim-polyglot'                     " massive language pack
    " Plug 'vim-python/python-syntax'                 " python (in polyglot)
    " Plug 'rust-lang/rust.vim'                       " rust (in polyglot)
    " Plug 'mboughaba/i3config.vim'                   " i3 config (in polyglot)
    " Plug 'baskerville/vim-sxhkdrc'                  " sxhkd (in polyglot)
    " Plug 'kovetskiy/sxhkd-vim'                      " sxhkd
    " Plug 'lervag/vimtex'                            " latex

  " search/find
  " ----------------------------------------------------------------------------
    " Plug 'ctrlpvim/ctrlp.vim' " Fuzzy find files
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " install latest fzf
    Plug 'junegunn/fzf.vim' " fzf support
    " Plug 'jremmen/vim-ripgrep' " ripgrep, fzf alternative

  " navigation
  " ----------------------------------------------------------------------------
    " Plug 'vifm/vifm.vim'                  " vifm for file picking
    " Plug 'rbgrouleff/bclose.vim'          " lf dependency
    " Plug 'ptzz/lf.vim'                    " lf integration (might not need this, check br dotfiles)
    " Plug 'justinmk/vim-sneak'             " not really sure what this does
    " Plug 'easymotion/vim-easymotion'      " not really sure what this does
    " Plug 'christoomey/vim-tmux-navigator' " move between tmux banes and vim splits

  " bracket management
  " ----------------------------------------------------------------------------
    " Plug 'tpope/vim-surround'   " easy tag switching
    " Plug 'alvan/vim-closetag'   " close (X)HTML tags
    " Plug 'frazrepo/vim-rainbow' " color brackets
    " Plug 'luochen1990/rainbow'  " color brackets

  " notetaking
  " ----------------------------------------------------------------------------
    " Plug 'vimwiki/vimwiki'      " notetaking
    " Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']} " markdown synced preview with browser
    " Plug 'suan/vim-instant-markdown', {'for': 'markdown'}" Markdown Preview
    " Plugin 'vim-pandoc/vim-pandoc' " pandoc integration
    " Plug 'vim-pandoc/vim-pandoc-syntax' " pandoc syntax support

  " display colors
  " ----------------------------------------------------------------------------
    " Plug 'ap/vim-css-color'       " color name highlighter
    " Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' } " display colors in file

  " misc
  " ----------------------------------------------------------------------------
    " Plug 'dhruvasagar/vim-table-mode' " table formatting
    Plug 'tpope/vim-commentary'   " comment stuff out
    " Plug '/home/mpaulson/personal/vim-be-good' " ThePrimeagen games for vim practice
    " Plug 'junegunn/vim-emoji'             " vim emojis
    " Plug 'mbbill/undotree' " visualize undo history
    " Plug 'vim-utils/vim-man' " view man pages in vim

  " explore later (check links on these pages)
  " ----------------------------------------------------------------------------
    " vim-pandoc-after
    " vim-pad
    " Plug 'tpope/vim-repeat'

  call plug#end()

" SETTINGS
"==============================================================================

  " Basics:
  if !exists('g:syntax_on') | syntax enable | endif " recognize syntax by filename.
  set ic                          " ignore case in search pattern
  set scs                         " override ignorecase if pattern has uppercase letters
  set nu rnu                      " line number, relative
  set mouse=a                     " allow for mouse in all modes (except hit enter prompt)
  set enc=utf-8                   " encoding
  set bg=dark                     " background color
  set cb+=unnamedplus             " Use system clipboard
  set is                          " incremental search (higlight while typing pattern)
  set nowrap                      " avoid line wrapping
  set noswf                       " don't use a swapfile
  set nobk                        " don't make file backups
  set udir=~/.config/nvim/undodir " directory for undo files
  set udf                         " automatically save history in undo file
  set bs=indent,eol,start         " set backspace functionality
  set cul                         " highlight cursor line
  set cuc                         " highlight cursor column
  set sb spr                      " have split and vsplit open at bottom and right, respectively
  set lbr                         " when wrap is on, wrap at 'breakat' character

  " character limit indicator
  set cc=80                       " highlight column 80
  highlight ColorColumn ctermbg=0 guibg=lightgrey " not sure what this does yet

  " Tab
  set ts=2  " number of spaces in one tab
  set sts=2 " number of spaces in one tab in editing operations
  set sw=2  " number of spaces for ashifts and autoindents
  set et    " use spaces instead of tab character
  set si    " smart autoindenting on newlines

  " not really sure what these do yet
  " set tgc       " enables 24-bit RGB color
  " set nohls
  " set nosm
  " set wim=longest,list,full " Enable Autocompletion
  " set scrolloff=8
  " set cmdheight=2 " Give more space for displaying messages.
  " set shortmess+=c " Don't pass messages to |ins-completion-menu|.
  " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
  " delays and poor user experience.
  " set updatetime=50



" LANGUAGE-SPECIFIC SETTINGS
"==============================================================================
  autocmd FileType text   setlocal wrap            " wrap for textfiles
  autocmd FileType python setlocal ts=2 sts=2 sw=2 " 2-space tabs in python
  autocmd TermOpen * setlocal nonu norelativenumber | startinsert " remove line numbers in terminals
" KEYMAPS
"==============================================================================
  let mapleader =" "          " set mod (no repeat with leader pressed atm)
  noremap <leader>g :Goyo<CR> " goyo mode
  map     <leader>n :NERDTreeToggle<CR> " nerdtree

  " Shortcutting split navigation
  map <leader>h <C-w>h
  map <leader>j <C-w>j
  map <leader>k <C-w>k
  map <leader>l <C-w>l

  " noremap <C-h> :wincmd h<CR>
  " noremap <C-j> :wincmd j<CR>
  " noremap <C-k> :wincmd k<CR>
  " noremap <C-l> :wincmd l<CR>


" " Compile document, be it groff/LaTeX/markdown/etc.
" map <leader>c :w! \| !compiler <c-r>%<CR>

" " Open corresponding .pdf/.html or preview
" map <leader>p :!opout <c-r>%<CR><CR>



" nmap <C-n> :NERDTreeToggle<CR>


" nerdtree settings
"----------------------------------------------------
let g:NERDTreeShowHidden=1 " show hidden files by default
let g:NERDTreeMouseMode=3 " single click to open

" autocmd VimEnter */workspace/* NERDTree | wincmd p " when opening vim on a directory, open with nerdtree and go to main window
" autocmd VimEnter * NERDTree | wincmd p " when opening vim on a directory, open with nerdtree and go to main window

" handle opening a directory. see README on nerdtree github
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
" autocmd BufWinEnter * NERDTreeMirror " mirror tree in new buffers (and Im guessing tabs)

" close buffer without closing window
map <silent> <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>


let g:gruvbox_contrast_dark = 'soft'
colorscheme gruvbox
