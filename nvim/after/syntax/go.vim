" Maintainer: Gary Shih
" Last udpated: 2021-06-29

syn match   goOperator "[+\-*%&|^<>=!:.()[\]{},;]"
syn match   goOperator "[/][^/*]"
hi def link goOperator Operator

syn keyword goImport import
hi def link goImport Include

syn keyword goPredefinedIdentifiers nil iota
syn keyword goBoolean               true false
hi def link goPredefinedIdentifiers goBoolean
hi def link goBoolean Boolean
