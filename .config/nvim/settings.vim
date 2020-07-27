" basics:

" enable syntax, prevent weird re-sourcing once syntax is already on
if !exists('g:syntax_on') | syntax enable | endif
set encoding=utf-8              " encoding
set background=dark             " background color
set clipboard+=unnamedplus      " Use system clipboard
set splitbelow splitright       " have split and vsplit open at bottom and right, respectively

" search
set ignorecase                  " ignore case in search pattern
set smartcase                   " override ignorecase if pattern has uppercase letters
set incsearch                   " incremental search (higlight while typing pattern)

" editor window
set number relativenumber       " line number, relative (hybrid)
set colorcolumn=80              " highlight column 80
" set cursorline                  " highlight cursor line
" set cursorcolumn                " highlight cursor column

" line wrapping
set nowrap                      " avoid line wrapping
set linebreak                   " when wrap is on, wrap at 'breakat' character

" mouse settings
" set mouse=a                     " allow for mouse in all modes (except hit enter prompt) " A LITTLE SLOW
" map                             " use original scrolling
" set scrolloff=8 sidescrolloff=8 " centering the cursor

" backup media
set noswapfile                  " don't use a swapfile
set nobackup                    " don't make file backups
set udir=~/.config/nvim/undodir " directory for undo files
set undofile                    " automatically save history in undo file

" tab settings
set tabstop=2                   " number of spaces in one tab
set softtabstop=2               " number of spaces in one tab in editing operations
set shiftwidth=2                " number of spaces for ashifts and autoindents
set expandtab                   " use spaces instead of tab character
set smartindent                 " smart autoindenting on newlines

" status and buffer lines
set noshowmode                  " no need for show mode with a statusline
set showtabline=2               " always show tab(buffer) line
set laststatus=2                " allow last window to have a statusline


" prevent newline autocomment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o


" " fold settings
" set foldmethod=indent
" set foldnestmax=10
" set nofoldenable
" set foldlevel=2


" " fzf settings
" let g:fzf_preview_window = 'right:60%'


" attempts to speed things up
" set lazyredraw
" set updatetime=300



" set noshowcmd " no more training wheels




" " Languages and Filetypes
" "==============================================================================
autocmd FileType text   setlocal wrap            " wrap for textfiles
" autocmd FileType python setlocal ts=2 sts=2 sw=2 " 2-space python tabs
autocmd TermOpen *      setlocal nonu nornu      " no nums in terminal
autocmd TermOpen *      start                    " start insert in term
" autocmd TermOpen *      setlocal termguicolors!  " don't let colorscheme effect terminal

" " set syntax for nonstandard filetypes
autocmd BufNewFile,BufRead brewfile set syntax=ruby
autocmd BufNewFile,BufRead aptfile  set syntax=zsh
autocmd BufNewFile,BufRead skhdrc   set syntax=zsh
autocmd BufNewFile,BufRead lfrc     set syntax=zsh






" not entirely sure what these do yet
" set nohls
" set nosm
" set wim=longest,list,full " Enable Autocompletion
" set cmdheight=2 " Give more space for displaying messages.
" set shortmess+=c " Don't pass messages to |ins-completion-menu|.
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
" set updatetime=50




" up next;
" how do I switch buffer order?
" remove extra garbage from nerdtree statusline
" keybind to go to nerdtree split (and open it if it's not open)
" keybind to open and close nerdtree without focusing on the split
