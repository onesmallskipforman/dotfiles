" set colorscheme
colorscheme gruvbox
" colorscheme vim-monokai-tasty
" colorscheme wpgtk
" colorscheme wal
" colorscheme base16-gruvbox-dark-soft
" colorscheme wal


" conditional color settings
if get(g:, 'colors_name', 'default') == "gruvbox"
  set termguicolors
  let g:gruvbox_contrast_dark = 'soft'
  let g:gruvbox_italic = 1
  let g:gruvbox_invert_selection='0'
endif

if get(g:, 'colors_name', 'default') == "vim-monokai-tasty"
  set termguicolors
  let g:vim_monokai_tasty_italic = 1
endif

" if g:colors_name == "base16-"
"   if filereadable(expand("~/.vimrc_background"))
"     let base16colorspace=256
"     source ~/.vimrc_background
"   endif
" endif



" theme-independent italics (currently not working)
" let &t_ZH="\e[3m"
" let &t_ZR="\e[23m"
" highlight Comment cterm=italic
