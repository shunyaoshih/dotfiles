" Maintainer: Gary Shih
" Last updated: 2021-06-25

" Preprocs
syn keyword cDefined defined contained containedin=cDefine
hi def link cDefined cDefine

" Booleans
syn keyword cBoolean true false TRUE FALSE

" Links
hi def link cFunction   Function
hi def link cIdentifier Identifier
hi def link cBoolean    Boolean

hi link cIncluded Include

" Operators
if !exists('g:c_syntax_operator_highlight') || g:c_syntax_operator_highlight == 1
  syn match cOperator "\(<<\|>>\|[-+*/%&^|<>!=]\)="
  syn match cOperator "<<\|>>\|&&\|||\|++\|--\|->"
  syn match cOperator "[.!?:~*&%<>^|=,+-]"
  syn match cOperator "/[^/*=]"me=e-1
  syn match cOperator "/$"
  syn match cOperator "&&\|||"

  " highlight : in label or scope identifier
  hi link cUserCont Operator
endif

if !exists('g:c_syntax_delimiter_highlight') || g:c_syntax_delimiter_highlight == 1
  " Delimiters
  syn match cDelimiter    "[;\\]"
  syn match cParens display "[()]"
  syn match cBraces display "[{}]"
  syn match cBrackets display "[][]"

  hi link cParens     cDelimiter
  hi link cBraces     cDelimiter
  hi link cBrackets   cDelimiter
  hi link cDelimiter  Delimiter
endif

syn keyword cppString string
hi def link cppString Type
