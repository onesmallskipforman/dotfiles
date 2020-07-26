
" let g:startify_files_number = 6
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

" I don't know what sessions are/do yet.
" let g:startify_session_dir = '~/.config/nvim/session'
" let g:startify_session_delete_buffers = 1
" let g:startify_session_persistence = 1

" over-the-top (no pun intended) header
let g:startify_custom_header =
  \ startify#pad(split(system('figlet -w 150 -f broadway "Vim"'), '\n'))

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
