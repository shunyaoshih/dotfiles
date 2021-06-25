" Maintainer: Gary Shih
" Last udpated: 2021-06-25

syn match goOperator "[+\-*%&|^<>=!:.()[\]{},;]"
syn match goOperator "[/][^/*]"
hi def link goOperator Operator

syn keyword goImport import
hi def link goImport Include

syn keyword goBoolean true false
hi def link goBoolean Boolean
