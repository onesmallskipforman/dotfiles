" global settings
if !exists('g:syntax_on') | syntax enable | endif " enable syntax once (NT)

set encoding=utf-8              " encoding
set nowrap                      " avoid line wrapping
set linebreak                   " when wrap is on, wrap at 'breakat' character
set foldmethod=indent           " set fold grouping method
set foldnestmax=10              " set max nested folds
set nofoldenable                " start with fold off
set tabstop=2                   " number of spaces in one tab
set softtabstop=2               " number of spaces in one tab in editing operations
set shiftwidth=2                " number of spaces for ashifts and autoindents
set expandtab                   " use spaces instead of tab character
set smartindent                 " smart autoindenting on newlines
set background=dark             " background color
set mouse=a                     " allow for mouse in all modes (except hit enter prompt)
set number relativenumber       " line number, relative (hybrid)
" set cursorline                  " highlight cursor line
" set cursorcolumn                " highlight cursor column
set colorcolumn=80              " highlight column 80
set laststatus=2                " allow last window to have a statusline
set noshowmode                  " no need for show mode with a statusline
set showtabline=2               " always show tab(buffer) line
" set noshowcmd                  " no more training wheels
" set lazyredraw                 " don't redraw while executing macros - less lag and flickering
set updatetime=300              " helps completion and supposedly user experience in general
set hidden                      " allows you to switch buffers without write
set splitbelow splitright       " have split and vsplit open at bottom and right, respectively
set scrolloff=8                 " centering the cursor vertical
set sidescrolloff=8             " centering the cursor horizontal
set pumheight=10                " set completion popup window length
set wildmode=longest:full,full  " complete longest common string and show list
set wildignorecase              " ignore case in wildmode
set ignorecase                  " ignore case in search pattern
set smartcase                   " override ignorecase if pattern has uppercase letters
set incsearch                   " incremental search (higlight while typing pattern)
set clipboard+=unnamedplus      " Use system clipboard
set dict+=/usr/share/dict/words " use system dictionary
set noswapfile                  " don't use a swapfile
set nobackup                    " don't make file backups
set udir=~/.config/nvim/undodir " directory for undo files
set undofile                    " automatically save history in undo file
set signcolumn=yes              " provide room for lint column
set cmdheight=1                 " Give more space for displaying messages.
set nowritebackup               " Servers can have backup file issues, coc #649
set shortmess+=c                " Don't pass messages to |ins-completion-menu|.

" context-specific settings
autocmd FileType *        setlocal fo-=c fo-=r fo-=o " prevent newline autocomment
autocmd FileType text     setlocal wrap              " wrap for textfiles
autocmd FileType python   setlocal ts=2 sts=2 sw=2   " 2-space python tabs
autocmd FileType nerdtree setlocal signcolumn=no     " no lint column for nerdtree
autocmd FileType nerdtree setlocal nonu nornu        " no line numbers for nerdtree
autocmd FileType startify setlocal cursorline        " add cursorline to startify
autocmd TermOpen    * setlocal nonu nornu            " no nums in terminal
autocmd TermOpen    * setlocal signcolumn=no         " no lint col in terminal
autocmd TermOpen    * start                          " start insert in term
autocmd BufWritePre * %s/\s\+$//e                    " remove trailing whitespace
autocmd BufWritepre * %s/\n\+\%$//e                  " remove trailing newlines
autocmd BufNewFile,BufRead brewfile set syntax=ruby  " set brewfiles as ruby
autocmd BufNewFile,BufRead aptfile  set syntax=sh   " use zsh hl for aptfile
autocmd BufNewFile,BufRead skhdrc   set syntax=sh   " use zsh hl for skhdrc
autocmd BufNewFile,BufRead lfrc     set syntax=sh   " use zsh hl for lfrc

let g:is_posix=1 " use posix syntax highlighting for sh scripts
