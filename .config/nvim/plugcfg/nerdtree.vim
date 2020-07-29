" basic config
let g:NERDTreeShowHidden=1    " show hidden files by default
let g:NERDTreeMouseMode=2     " double click to open
let NERDTreeIgnore=['\.git$'] " ignore git folders

" reducing nerdtree lag
" let g:NERDTreeSyntaxDisableDefaultExtensions = 1
" let g:NERDTreeDisableExactMatchHighlight = 1
" let g:NERDTreeDisablePatternMatchHighlight = 1
" let g:NERDTreeHighlightCursorline = 0
" let g:NERDTreeSyntaxEnabledExtensions = ['c', 'h', 'cpp', 'py', 'rb', 'sh'] " example

" themeing
" highlight! link NERDTreeDir NERDTreeFlags " set folder name color to be the same as file name color
" highlight! link NERDTreeFlags NERDTreeDir

" when running nvim on a directory, prevent NERDTree from hiding when first selecting a file
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | wincmd p | endif

" quit if nerdtree is last and only buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
