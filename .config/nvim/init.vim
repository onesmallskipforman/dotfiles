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
    Plug 'mengelbrecht/lightline-bufferline'       " bufferline for lightline
    Plug 'preservim/nerdtree'                      " alternative file tree
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " Nerdtree highlight
    Plug 'ryanoasis/vim-devicons'                  " Nerdtree Icons
    " Plug 'junegunn/limelight.vim'                  " Hyperfocus on a range
    " Plug 'voldikss/vim-floaterm'                   " floating builtin terminal
    " Plug 'terryma/vim-multiple-cursors' " sublime/vscode -like multiple selection
    " Plug 'bling/vim-bufferline' " add buffer list to command bar
  " colorschemes
  " ----------------------------------------------------------------------------
    Plug 'dylanaraps/wal.vim'
    Plug 'chriskempson/base16-vim' " base16color pack
    Plug 'flazz/vim-colorschemes'  " color pack
    Plug 'morhetz/gruvbox'
    Plug 'patstockwell/vim-monokai-tasty'
    " Plug 'gruvbox-community/gruvbox'
    Plug 'deviantfero/wpgtk.vim'
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

" gruvbox
set termguicolors
let g:gruvbox_contrast_dark = 'soft'
let g:gruvbox_italic = 1
colorscheme gruvbox

" monokai
" set termguicolors
" let g:vim_monokai_tasty_italic = 1
" colorscheme vim-monokai-tasty

" wpgkt
" colorscheme wpgtk

" wal
" colorscheme wal

" theme-independent italics (currently not working)
" let &t_ZH="\e[3m"
" let &t_ZR="\e[23m"
" highlight Comment cterm=italic

" base16-shell setup
" if filereadable(expand("~/.vimrc_background"))
"   let base16colorspace=256
"   source ~/.vimrc_background
" endif

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
 " highlight ColorColumn ctermbg=8 ctermfg=7
 " highlight CursorColumn ctermbg=8 ctermfg=7
 " highlight CursorLine cterm=NONE ctermbg=8 ctermfg=7

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


  " up next;
  " use numbers to reach tabs
  " use leader g and leager semicolon to move buffers directional
  " how do I switch buffer order?
  " remove extra garbage from nerdtree statusline
  " keybind to go to nerdtree split (and open it if it's not open)
  " keybind to open and close nerdtree without focusing on the split

" " Compile document, be it groff/LaTeX/markdown/etc.
" map <leader>c :w! \| !compiler <c-r>%<CR>

" " Open corresponding .pdf/.html or preview
" map <leader>p :!opout <c-r>%<CR><CR>



" set syntax for nonstandard filetypes
autocmd BufNewFile,BufRead brewfile set syntax=ruby
autocmd BufNewFile,BufRead aptfile set syntax=sh
autocmd BufNewFile,BufRead skhdrc set syntax=sh
autocmd BufNewFile,BufRead spacebarrc set syntax=sh





" nmap <C-n> :NERDTreeToggle<CR>

" airline settings
"---------------------------------------------------
  " let g:airline#extensions#bufferline#enabled = 1 " enable bufferline
  " let g:airline#extensions#tabline#enabled = 1 " enable tabline
  " let g:airline#extensions#tabline#formatter = 'unique_tail'
  " let g:airline_left_sep=''
  " let g:airline#extensions#tabline#show_close_button = 1

" lightline settings
"----------------------------------------------------
  set noshowmode " no need for show mode with a statusline
  let g:lightline = {
    \ 'colorscheme': 'gruvbox',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'tabline': {
    \   'left': [ ['buffers'] ],
    \   'right': [ ['close'] ]
    \ },
    \ 'component_expand': {
    \   'buffers': 'lightline#bufferline#buffers'
    \ },
    \ 'component_type': {
    \   'buffers': 'tabsel'
    \ }
    \ }

  " separators
   let g:lightline.separator = { 'left': "\ue0bc", 'right': "\ue0ba" }
   let g:lightline.subseparator = { 'left': "\ue0b9", 'right': "\ue0bb" }

  let g:lightline#bufferline#filename_modifier = ':t'


  let g:lightline#bufferline#show_number  = 2
  let g:lightline#bufferline#shorten_path = 0
  let g:lightline#bufferline#unnamed      = 'untitled' " name for unnamed buffers


  let g:lightline#bufferline#unicode_symbols=1 " fancier symbols


  set showtabline=2 " always show tabline
  let g:lightline#bufferline#min_buffer_count=0 " min buffers to show tabline (not sure how this plays with set showtabline)




  let g:lightline#bufferline#enable_devicons=1 " enable devicons



  " clickable buffer tabs
  let g:lightline#bufferline#clickable=1
  let g:lightline.component_raw = {'buffers': 1}






" nerdtree settings
"----------------------------------------------------
let g:NERDTreeShowHidden=1 " show hidden files by default
let g:NERDTreeMouseMode=3 " click to open

" let g:NERDTreeStatusline = '%#NonText#' " customize status line for nerdtree


" autocmd VimEnter */workspace/* NERDTree | wincmd p " when opening vim on a directory, open with nerdtree and go to main window
" autocmd VimEnter * NERDTree | wincmd p " when opening vim on a directory, open with nerdtree and go to main window

" handle opening a directory. see README on nerdtree github
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
" autocmd BufWinEnter * NERDTreeMirror " mirror tree in new buffers (and Im guessing tabs)

let NERDTreeIgnore=['\.git$'] " ignore git folders


" close buffer without closing window
map <silent> <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>



" " let base16colorspace=256
" colorscheme base16-default-dark
" colorscheme gruvbox
