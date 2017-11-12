# vim

My vim configuration

## Requirements

* vim >= 8.0

## Shortcuts

- toggle paste mode: `F2`
- toggle wrap line: `F3`
- exchange `0` and `^`
- `<`: `<gv`
- `>`: `>gv`
- `Y`: `y$`
- `Q`: `@q`
- save file: `<leader>w`
- quit without saving file: `<leader>q`
- save file and quit: `<leader>x`
- remove trailing whitespace: `<leader>rt`
- clear highlight: `<leader>nh`
- copy full file path: `<leader>pw`
- copy full file path without the file name: `<leader>po`
- insert an empty line below/above: `Ctrl` + `j` / `Ctrl` + `k`
- delete an empty line below/above: `Alt` + `j` / `Alt` + `k`

### C/C++
- compile: `F9`
- execute: `F5`
- execute with file input: `F6`
- execute with file input/output: `F7`

### Python
- execute: `F5`

### Latex
- toggle continuous compile mode: `<leader>ll`
- preview: `<leader>lv`

### Markdown
- open live preview window: `<leader>o`(macOS only)

### nerdtree
- toggle: `<leader><leader>`
- go to the next/previous tab: `<leader>j` / `<leader>f`

### tagbar
- toggle: `<leader>t`

### Snippets
- expand: `Ctrl` + `k`

### ale

- go to the next/previouw warning or error: `]f` / `[f`

## Plugins

Managed by [vim-plug](https://github.com/junegunn/vim-plug)

### Colorscheme

* [pikacode.vim](https://github.com/leomao/pikacode.vim)
* [lightline.vim](https://github.com/itchyny/lightline.vim)
* [lightline-pika](https://github.com/leomao/lightline-pika)

### File explorer

* [nerdtree](https://github.com/scrooloose/nerdtree)
* [nerdtree-tabs](https://github.com/jistr/vim-nerdtree-tabs)
* [tagbar](https://github.com/majutsushi/tagbar)

### Autocompletion

* [YouComleteMe](https://github.com/Valloric/YouCompleteMe)

### Snippets

* [ultisnips](https://github.com/SirVer/ultisnips)
* [vim-snippets](https://github.com/honza/vim-snippets)

### Edit

* [nerdcommenter](https://github.com/scrooloose/nerdcommenter)
* [easymotion](https://github.com/easymotion/vim-easymotion)
* [vim-surround](https://github.com/tpope/vim-surround)

### Git related

* [vim-fugitive](https://github.com/tpope/vim-fugitive)
* [gv.vim](https://github.com/junegunn/gv.vim)
* [vim-signify](https://github.com/mhinz/vim-signify)

### Asynchronous linter

* [ale](https://github.com/w0rp/ale)

### Python related

* [python-syntax](https://github.com/hdima/python-syntax)
* [vim-python-pep8-indent](https://github.com/Vimjas/vim-python-pep8-indent)

### Latex related

* [vimtex](https://github.com/lervag/vimtex)

### Markdown related

* [vim-xmark](https://github.com/junegunn/vim-xmark)