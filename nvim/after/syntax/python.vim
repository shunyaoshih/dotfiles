" Maintainer: Gary Shih
" Last updated: 2021-06-25

syn keyword pythonConstant None True False
hi def link pythonConstant Constant

syn keyword pythonStatement import from
hi link pythonStatement Statement
hi link pythonInclude     Include
hi link pythonDecorator   Decorator

syn keyword pythonClass class
" syn match   pythonClass    "[a-zA-Z_][a-zA-Z0-9_]*" display contained
hi def link pythonClass Type

syn match pythonDot "\." containedin=pythonFunction
hi link pythonDot       Delimiter

" Delimiters
syn match pythonDelimiter "[/~!%^&*()-+=[\]{},.<>?:;]"
syn match pythonDelimiter "\-"

hi link pythonParens     pythonDelimiter
hi link pythonBrackets   pythonDelimiter
hi link pythonBraces     pythonDelimiter
hi link pythonComma      pythonDelimiter
hi link pythonColon      pythonDelimiter
hi link pythonDelimiter  Delimiter

syn keyword pythonSelf self
hi def link pythonSelf Identifier
