

let g:NERDTreeShowHidden=1 " show hidden files by default
let g:NERDTreeMouseMode=2 " double click to open

" ignore git folders
let NERDTreeIgnore=['\.git$']


" let g:NERDTreeStatusline = '%#NonText#' " customize status line for nerdtree


" autocmd VimEnter * NERDTree | wincmd p " when opening vim on a directory, open with nerdtree and go to main window

" when running nvim on a directory, prevent NERDTree from hiding when first selecting a file
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | wincmd p | endif

" TODO: get the above feature to work when opening a directory from vim-startify


" quit if nerdtree is last and only buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif



" highlight! link NERDTreeDir NERDTreeFlags " set folder name color to be the same as file name color

" config to reduce nerdtree lag
" let g:NERDTreeSyntaxDisableDefaultExtensions = 1
" let g:NERDTreeDisableExactMatchHighlight = 1
" let g:NERDTreeDisablePatternMatchHighlight = 1
" let g:NERDTreeHighlightCursorline = 0
" let g:NERDTreeSyntaxEnabledExtensions = ['c', 'h', 'cpp', 'py', 'rb', 'sh'] " example



" highlight! link NERDTreeFlags NERDTreeDir
