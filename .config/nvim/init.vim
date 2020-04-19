
call plug#begin('~/.config/nvim/plugged')

Plug 'preservim/nerdtree'
Plug 'morhetz/gruvbox' "
Plug 'lervag/vimtex' " vim sync
Plug 'junegunn/goyo.vim' " distraction-free writing

" Plug 'airblade/vim-gitgutter'
" Plug 'christoomey/vim-tmux-navigator'


" Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-surround'
" Plug 'tpope/vim-repeat'
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'airblade/vim-gitgutter'
" Plug 'tpope/vim-commentary'

" Plug 'sickill/vim-monokai'

" Plug 'erichdongubler/vim-sublime-monokai'
" Plug 'itchyny/lightline.vim'
" Plug 'junegunn/goyo.vim'
" Plug 'haya14busa/vim-keeppad'
" Plug 'erichain/vim-monokai-pro'
" Plug 'phanviet/vim-monokai-pro'
" Plug '/usr/local/opt/fzf'
call plug#end()

" Compile document, be it groff/LaTeX/markdown/etc.
map <leader>c :w! \| !compiler <c-r>%<CR>

" Open corresponding .pdf/.html or preview
map <leader>p :!opout <c-r>%<CR><CR>



nmap <C-n> :NERDTreeToggle<CR>




let g:gruvbox_contrast_dark = 'soft'
set background=dark
colorscheme gruvbox

" colorscheme sublimemonokai





set number
set backspace=indent,eol,start
" set rtp+=/usr/local/opt/fzf
