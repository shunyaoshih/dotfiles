" Maintainer: Gary Shih
" Last udpated: 2021-07-08

" Disable syn region defined in vim-go.
syn clear    goImport
syn keyword  goImport import
hi! def link goImport Statement

syn match goOperator "[()[\]{}]"
hi def link goOperator Operator

hi link goReceiver Operator
