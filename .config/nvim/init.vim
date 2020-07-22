" Source Files
source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/theme.vim
" source $HOME/.config/nvim/settings.vim
source $HOME/.config/nvim/lightline.vim
source $HOME/.config/nvim/mappings.vim
source $HOME/.config/nvim/devicons.vim
source $HOME/.config/nvim/nerdtree.vim


" SETTINGS
"==============================================================================

  " basics:
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
  set cc=80                       " highlight column 80
  set ts=2                        " number of spaces in one tab
  set sts=2                       " number of spaces in one tab in editing operations
  set sw=2                        " number of spaces for ashifts and autoindents
  set et                          " use spaces instead of tab character
  set si                          " smart autoindenting on newlines

  set noshowmode " no need for show mode with a statusline
  set showtabline=2 " always show tabline




" fold settings
set foldmethod=indent   
set foldnestmax=10
set nofoldenable
set foldlevel=2


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

" Languages and Filetypes
"==============================================================================
  autocmd FileType text   setlocal wrap            " wrap for textfiles
  autocmd FileType python setlocal ts=2 sts=2 sw=2 " 2-space python tabs
  autocmd TermOpen *      setlocal nonu nornu      " no nums in terminal
  autocmd TermOpen *      start                    " start insert in term

  " set syntax for nonstandard filetypes
  autocmd BufNewFile,BufRead brewfile set syntax=ruby
  autocmd BufNewFile,BufRead aptfile  set syntax=zsh
  autocmd BufNewFile,BufRead skhdrc   set syntax=zsh
  autocmd BufNewFile,BufRead lfrc     set syntax=zsh


  " up next;
  " how do I switch buffer order?
  " remove extra garbage from nerdtree statusline
  " keybind to go to nerdtree split (and open it if it's not open)
  " keybind to open and close nerdtree without focusing on the split


" fzf settings
let g:fzf_preview_window = 'right:60%'




