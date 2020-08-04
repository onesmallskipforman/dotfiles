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

" ensure files and other buffers no opened on nerdtree split

" prevent buffers opened while focused on NT from populating NT's split
au BufEnter * :call Nerdbufhandler()
function! Nerdbufhandler()
  if bufname('#') =~ 'NERD_tree' && bufname('%') !~ 'NERD_tree' && winnr('$') > 1
    let l:lastb = bufnr('%') | b#
    exe "normal! \<c-w>\<c-p>"
    execute ':b ' l:lastb | endif
endfunction

" needed for to avoid crashes when calling vim-plug functions while the cursor is on the NERDTree window
let g:plug_window = 'noautocmd vertical topleft new'



" " nerdtree_syntax_highlight settings

" " let g:WebDevIconsDisableDefaultFolderSymbolColorFromNERDTreeDir = 1
" " let g:NERDTreeFileExtensionHighlightFullName = 1

" let s:brown       = "905532"
" let s:aqua        = "3AFFDB"
" let s:blue        = "689FB6"
" let s:darkBlue    = "44788E"
" let s:purple      = "834F79"
" let s:lightPurple = "834F79"
" let s:red         = "AE403F"
" let s:beige       = "F5C06F"
" let s:yellow      = "F09F17"
" let s:orange      = "D4843E"
" let s:darkOrange  = "F16529"
" let s:pink        = "CB6F6F"
" let s:salmon      = "EE6E73"
" let s:green       = "8FAA54"
" let s:lightGreen  = "31B53E"
" let s:white       = "FFFFFF"
" let s:rspec_red   = 'FE405F'
" let s:git_orange  = 'F54D27'

" " Color unmatched folder and file icons having the same color as their labels
" " let g:WebDevIconsDisableDefaultFolderSymbolColorFromNERDTreeDir = 1
" " let g:WebDevIconsDisableDefaultFileSymbolColorFromNERDTreeFile = 1

" " Disable unmatched folder and file icons having the same color as their labels
" let g:WebDevIconsDefaultFolderSymbolColor = s:beige
" let g:WebDevIconsDefaultFileSymbolColor = s:blue
