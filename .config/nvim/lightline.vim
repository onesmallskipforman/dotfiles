" get icons for file type and format
function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

" configure line
let g:lightline = {
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename', 'modified' ] ]
  \ },
  \ 'tabline': {
  \   'left': [ ['buffers'] ],
  \   'right': [ [] ]
  \ },
  \ 'component_expand': {
  \   'buffers': 'lightline#bufferline#buffers'
  \ },
  \ 'component_type': {
  \   'buffers': 'tabsel'
  \ },
  \ 'component_function': {
  \   'filetype': 'MyFiletype',
  \   'fileformat': 'MyFileformat',
  \ }
  \ }

" coloring
if g:colors_name == 'gruvbox'
  let g:lightline.colorscheme = 'gruvbox'
elseif g:colors_name == 'vim-monokai-tasty'
  let g:lightline.colorscheme = 'monokai_tasty'
endif

" separators
let g:lightline.separator = { 'left': "\ue0bc", 'right': "\ue0ba" }
let g:lightline.subseparator = { 'left': "\ue0bb", 'right': "\ue0bb" }

" label buffer with ordinal number, icon, and path tail
let g:lightline#bufferline#enable_devicons=1
let g:lightline#bufferline#filename_modifier = ':t'
let g:lightline#bufferline#show_number  = 2

" name for unnamed buffers
let g:lightline#bufferline#unnamed      = 'untitled'

" fancier symbols
let g:lightline#bufferline#unicode_symbols=1

" clickable buffer tabs
let g:lightline#bufferline#clickable=1
let g:lightline.component_raw = {'buffers': 1}
