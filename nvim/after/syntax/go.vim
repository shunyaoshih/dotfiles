" Disable syn region defined in vim-go.
syntax clear    goImport
syntax keyword  goImport import
highlight def link goImport Statement

highlight link goReceiver Operator

syntax match goPunctBracket /[()[\]{}]/
highlight def link goPunctBracket Operator

syntax match goPunctSpecial /[.,:;]/
highlight def link goPunctSpecial Operator
