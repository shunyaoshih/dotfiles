" Keep this syntax change in vim since proto is not supported in
" nvim-treesitter.
syn match protoOperator "[+\-*%&|^<>=!:.()[\]{},;]"
syn match protoOperator "[/][^/*]"
hi def link protoOperator Operator
