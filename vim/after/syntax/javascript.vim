" Maintainer: Gary Shih

syn match jsDelimiter    "[~!%^&*()-+=[\]{},.<>?:;]"

hi link jsParens     jsDelimiter
hi link jsBrackets   jsDelimiter
hi link jsBraces     jsDelimiter
hi link jsComma      jsDelimiter
hi link jsColon      jsDelimiter
hi link jsDelimiter  Delimiter

hi link jsArrowFunction    Function
hi link jsFunction         Function

syn keyword jsImport import from
hi def link jsImport Include

syn keyword jsClassWord class extends
hi def link jsClassWord Type

hi link javaScriptHtmlEleProperties Normal

syn keyword jsType const var let
hi def link jsType Type
