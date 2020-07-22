
" set leader key
let mapleader =" "   

" split navigation
map <silent> <C-h> <C-w>h
map <silent> <C-j> <C-w>j
map <silent> <C-k> <C-w>k
map <silent> <C-l> <C-w>l

" split resize - waiting on fixing wm keybinds
" nnoremap <silent> <M-h> :resize -2<CR>
" nnoremap <silent> <M-j> :resize +2<CR>
" nnoremap <silent> <M-k> :vertical resize -2<CR>
" nnoremap <silent> <M-l> :vertical resize +2<CR>

" " Compile document, be it groff/LaTeX/markdown/etc.
" map <leader>c :w! \| !compiler <c-r>%<CR>

" " Open corresponding .pdf/.html or preview
" map <leader>p :!opout <c-r>%<CR><CR>

" close buffer without closing window
map <silent> <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>

" cycle through buffers
nnoremap <silent> <TAB> :bnext<CR>
nnoremap <silent> <S-TAB> :bprevious<CR>

" open init.vim
map <leader>s :e $MYVIMRC<CR>

" plugin-specific
noremap  <leader>g  :Goyo<CR> 
map      <leader>n  :NERDTreeToggle<CR> 
map      <leader>f  :Lines<CR>
nnoremap <C-S-F>ps  :Rg<SPACE>
nnoremap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR> 

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

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
