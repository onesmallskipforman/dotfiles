" set leader key
let mapleader =" "

" allow for traversing wrapped lines without breaking vcount
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'

" split navigation
map <silent> <C-h> <C-w>h
map <silent> <C-j> <C-w>j
map <silent> <C-k> <C-w>k
map <silent> <C-l> <C-w>l

" split resize
map <silent> <C-Up> :resize -2<CR>
map <silent> <C-Down> :resize +2<CR>
map <silent> <C-Left> :vertical resize -2<CR>
map <silent> <C-Right> :vertical resize +2<CR>

" close buffer without closing window
map <silent><expr> <leader>qq &mod == 0 ? ':bp<bar>sp<bar>bn<bar>bd<CR>' : ':bd<CR>'

" cycle through buffers
nnoremap <silent> <TAB> :bnext<CR>
nnoremap <silent> <S-TAB> :bprevious<CR>

" open init.vim
nnoremap <silent> <leader>. :e $MYVIMRC<CR>

" plugin-specific
noremap  <leader>g  :Goyo<CR>
map      <leader>n  :NERDTreeToggle<CR>
map      <leader>f  :Lines<CR>
nnoremap <C-S-F>ps  :Rg<SPACE>
nnoremap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>

" " Start interactive EasyAlign in visual mode (e.g. vipga)
" xmap ga <Plug>(EasyAlign)

" " Start interactive EasyAlign for a motion/text object (e.g. gaip)
" nmap ga <Plug>(EasyAlign)

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

" use arrow keys in command mode completions
set wildcharm=<C-Z>
cnoremap <expr> <up> wildmenumode() ? "\<left>" : "\<up>"
cnoremap <expr> <down> wildmenumode() ? "\<right>" : "\<down>"
cnoremap <expr> <left> wildmenumode() ? "\<up>" : "\<left>"
cnoremap <expr> <right> wildmenumode() ? " \<bs>\<C-Z>" : "\<right>"

" Terminal window navigation
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l
inoremap <C-h> <C-\><C-N><C-w>h
inoremap <C-j> <C-\><C-N><C-w>j
inoremap <C-k> <C-\><C-N><C-w>k
inoremap <C-l> <C-\><C-N><C-w>l
tnoremap <Esc> <C-\><C-n> " TODO: find replacement so you can still use zsh vi mode

" comment stuff out with commentary
nnoremap <silent> <space>/ :Commentary<CR>
vnoremap <silent> <space>/ :Commentary<CR>gv

" move cursor through soft-wrapped lines
nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
nnoremap <expr> <Up>   (v:count == 0 ? 'gk' : '<Up>')
nnoremap <expr> <Down> (v:count == 0 ? 'gj' : '<Down>')
" finnicky. flickers from quickly switching modes
inoremap <expr> <Up>   (&wrap ? '<C-o>gk' : '<Up>')
inoremap <expr> <Down> (&wrap ? '<C-o>gj' : '<Down>')

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

" " Compile document, be it groff/LaTeX/markdown/etc.
" map <leader>c :w! \| !compiler <c-r>%<CR>

" " Open corresponding .pdf/.html or preview
" map <leader>p :!opout <c-r>%<CR><CR>
