" Maintainer: Gary Shih
" Last updated: 2021-06-25

syn match vimDelimiter "[/~!%^&*()-+=[\]{},.<>?:;]"
hi link vimDelimiter Delimiter

syn keyword vimPlug Plug
hi def link vimPlug Function
