" Maintainer: Gary Shih

syn match vimDelimiter "[/~!%^&*()-+=[\]{},.<>?:;]"
hi link vimDelimiter Delimiter

syn keyword vimPlug Plug
hi def link vimPlug Function
