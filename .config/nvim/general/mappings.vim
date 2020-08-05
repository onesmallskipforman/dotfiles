
" FUNCTIONS AND VARIABLES
"==============================================================================

" function for quitting buffer
function! s:quit()
  if (&mod == 0)
    bp | sp | bn | bd
  else
    bd
  endif
endfunction
noremap <silent> <leader>q :call <SID>quit()<CR>

" set leader key
let mapleader =" "

" INTERFACE SHORTCUTS
"==============================================================================

" open init.vim
nnoremap <silent> <leader>. :e $MYVIMRC<CR>

" cycle through buffers
nnoremap <silent> <TAB>   :bnext<CR>
nnoremap <silent> <S-TAB> :bprevious<CR>

" split navigation
map <silent> <C-h> <C-w>h
map <silent> <C-j> <C-w>j
map <silent> <C-k> <C-w>k
map <silent> <C-l> <C-w>l

" split resize
map <silent> <C-Up>    :resize -2<CR>
map <silent> <C-Down>  :resize +2<CR>
map <silent> <C-Left>  :vertical resize -2<CR>
map <silent> <C-Right> :vertical resize +2<CR>

" Terminal window navigation - TODO: find replacement to allow zsh vi mode
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l
inoremap <C-h> <C-\><C-N><C-w>h
inoremap <C-j> <C-\><C-N><C-w>j
inoremap <C-k> <C-\><C-N><C-w>k
inoremap <C-l> <C-\><C-N><C-w>l
tnoremap <Esc> <C-\><C-n>

" use arrow keys in command mode completions
set wildcharm=<C-Z>
cnoremap <expr> <up>    wildmenumode() ? "\<left>"     : "\<up>"
cnoremap <expr> <down>  wildmenumode() ? "\<right>"    : "\<down>"
cnoremap <expr> <left>  wildmenumode() ? "\<up>"       : "\<left>"
cnoremap <expr> <right> wildmenumode() ? "\<bs>\<C-Z>" : "\<right>"

" remove search highlights
noremap <silent> <C-_> :nohlsearch<CR>
" noremap <silent> <S-?> :let @/ = ""<CR>
" noremap <silent> <C-_> :let @/ = ""<CR>

" " Compile document, be it groff/LaTeX/markdown/etc.
" map <leader>c :w! \| !compiler <c-r>%<CR>

" " Open corresponding .pdf/.html or preview
" map <leader>p :!opout <c-r>%<CR><CR>

" EDITOR SHORTCUTS
"==============================================================================

" move cursor through soft-wrapped lines
nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
nnoremap <expr> <Up>   (v:count == 0 ? 'gk' : '<Up>')
nnoremap <expr> <Down> (v:count == 0 ? 'gj' : '<Down>')
" finnicky. flickers from quickly switching modes
inoremap <expr> <Up>   (&wrap ? '<C-o>gk' : '<Up>')
inoremap <expr> <Down> (&wrap ? '<C-o>gj' : '<Down>')

" allow for traversing wrapped lines without breaking vcount
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'

" shortcut to save buffer
noremap <silent> <leader>w :update<CR>
" inoremap <C-W> <C-\><C-N>:update<cr>gi

" move text up/down a line
nnoremap <A-Down> :m .+1<CR>==
nnoremap <A-Up>   :m .-2<CR>==
inoremap <A-Down> <Esc>:m .+1<CR>==gi
inoremap <A-Up>   <Esc>:m .-2<CR>==gi
vnoremap <A-Down> :m '>+1<CR>gv=gv
vnoremap <A-Up>   :m '<-2<CR>gv=gv

" TODO: Use this to move arbitrary number of lines
" nnoremap <expr> <A-Down> "m +" . (v:count1+1) . "<CR>"

" keep visual selection after indent
vnoremap < <gv
vnoremap > >gv

" more discreet scrolling - inconsistent on successive scrolls
" map <ScrollWheelUp> <C-Y>
" map <ScrollWheelDown> <C-E>

" PLUGIN MAPPINGS
"==============================================================================
noremap <silent> <leader>t :Rg<CR>
noremap <silent> <leader>, :Startify<CR>
noremap <silent> <leader>g :Goyo<CR>
noremap <silent> <leader>n :NERDTreeToggle<CR>
noremap <silent> <leader>l :Lines<CR>
noremap <silent> <leader>f :Files<CR>

" navigating buffline
nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)

" comment stuff out with commentary
nnoremap <silent> <space>/ :Commentary<CR>
vnoremap <silent> <space>/ :Commentary<CR>gv
" noremap  <silent> <M-/> <Esc>:Commentary<CR>gi

" " Start interactive EasyAlign in visual mode (e.g. vipga)
" xmap ga <Plug>(EasyAlign)

" " Start interactive EasyAlign for a motion/text object (e.g. gaip)
" nmap ga <Plug>(EasyAlign)
