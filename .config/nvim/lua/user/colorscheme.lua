vim.cmd [[
try
  " colorscheme darkplus
  let g:gruvbox_contrast_dark = 'soft'
  let g:gruvbox_italic = 1
  let g:gruvbox_inverse='0'
  colorscheme gruvbox
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
