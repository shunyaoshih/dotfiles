" Maintainer: Gary Shih

syn match javaDelimiter "[~!%^&*()\-+=[\]{},.<>?:;]"
hi link javaDelimiter  Delimiter

syn match javaDivide "\s/\s"
hi link javaDivide Delimiter

syn match javaOR "\s||\s"
hi link javaOR Delimiter

syn keyword javaType Integer Double String Scanner File
hi def link javaType Type

syn keyword javaThis this
hi def link javaThis Identifier

syn keyword javaNew new
hi def link javaNew Statement
