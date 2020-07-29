" set colorscheme
colorscheme gruvbox

" conditional color settings
if get(g:, 'colors_name', 'default') == "gruvbox"
  set termguicolors
  let g:gruvbox_contrast_dark = 'soft'
  let g:gruvbox_italic = 1
  let g:gruvbox_invert_selection='0'
elseif get(g:, 'colors_name', 'default') == "vim-monokai-tasty"
  set termguicolors
  let g:vim_monokai_tasty_italic = 1
endif
