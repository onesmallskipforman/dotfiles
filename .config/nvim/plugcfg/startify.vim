
let g:startify_files_number = 5
" let g:startify_change_to_vcs_root = 1 " inconsistent behavior
let g:startify_fortune_use_unicode = 1

" get devicons
function! StartifyEntryFormat()
  return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction

" categories for start page
let g:startify_lists = [
  \ { 'type': 'files',     'header': ['   Files']                        },
  \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
  \ { 'type': 'sessions',  'header': ['   Sessions']                     },
  \ { 'type': 'bookmarks', 'header': ['   Bookmarks']                    },
  \ ]

" bookmarks
let g:startify_bookmarks = [
  \ { 'i': '~/.config/nvim/init.vim' },
  \ { 'z': '~/.config/zsh/.zshrc' },
  \ { 'p': '~/Projects'},
  \ { 'b': '~/Projects/bootstrap'},
  \ ]

" don't show options for empty buffer and quit (they still work, though)
let g:startify_enable_special = 0

" color stuff - requires this file be sourced after colorscheme set
" hi! link StartifyHeader NONE
" highlight StartifyHeader  ctermfg=13 guifg=LightPurple

" padding for header
let g:startify_padding_left = 5

" over-the-top (no pun intended) header
let g:startify_custom_header =
  \ startify#pad(split(system('figlet -d $HOME/.local/src/figlet-fonts -w 150 -f Broadway "Vim"'), '\n'))

" let g:startify_custom_header = [
"   \"                                          .         .           ",
"   \" `8.`888b           ,8'  8 8888          ,8.       ,8.          ",
"   \"  `8.`888b         ,8'   8 8888         ,888.     ,888.         ",
"   \"   `8.`888b       ,8'    8 8888        .`8888.   .`8888.        ",
"   \"    `8.`888b     ,8'     8 8888       ,8.`8888. ,8.`8888.       ",
"   \"     `8.`888b   ,8'      8 8888      ,8'8.`8888,8^8.`8888.      ",
"   \"      `8.`888b ,8'       8 8888     ,8' `8.`8888' `8.`8888.     ",
"   \"       `8.`888b8'        8 8888    ,8'   `8.`88'   `8.`8888.    ",
"   \"        `8.`888'         8 8888   ,8'     `8.`'     `8.`8888.   ",
"   \"         `8.`8'          8 8888  ,8'       `8        `8.`8888.  ",
"   \"          `8.`           8 8888 ,8'         `         `8.`8888. ",
"   \]

" start startify and nerdtree
" autocmd VimEnter *
"             \   if !argc()
"             \ |   Startify
"             \ |   NERDTree
"             \ |   wincmd w
"             \ | endif
