" Maintainer: Gary Shih
" Last udpated: 2021-06-29

syn match   goOperator "[+\-*%&|^<>=!:.()[\]{},;]"
syn match   goOperator "[/][^/*]"
hi def link goOperator Operator

syn keyword goImport import

hi link goReceiver Operator
