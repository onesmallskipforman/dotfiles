
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


" highlight! link NERDTreeDir NERDTreeFlags " set folder name color to be the same as file name color

" config to reduce nerdtree lag
" let g:NERDTreeSyntaxDisableDefaultExtensions = 1
" let g:NERDTreeDisableExactMatchHighlight = 1
" let g:NERDTreeDisablePatternMatchHighlight = 1
" let g:NERDTreeHighlightCursorline = 0
" let g:NERDTreeSyntaxEnabledExtensions = ['c', 'h', 'cpp', 'py', 'rb', 'sh'] " example


" highlight! link NERDTreeDir


