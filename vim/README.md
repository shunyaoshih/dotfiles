# vim

My vim configuration

## Usage

```shell
$ xcode-select --install
$ mkdir Github; cd Github
$ git clone https://github.com/gantheory/dotfiles.git; cd dotfiles
$ ./deploy.sh vim
```

## Customization

### New Plugins

create a file under `~/.vim/custom` named `plugin.vim`, and add plugins in a
similar [vim-plug](https://github.com/junegunn/vim-plug) format as following.

```
Plug 'vim-go'
```

### Custom Settings

create a file under `~/.vim/custom` named `local.vim`, and add something like
the following.

```
set nocursorline
```

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
- show highlight group: `<leader>sh`
- move to previous/next buffer: `Ctrl` + `p` / `Ctrl` + `n`
- remove the current buffer: `Ctrl` + `c`

### C/C++
- compile: `F9`
- execute: `F5`
- execute with file input: `F6`
- execute with file input/output: `F7`
- jump to corresponding input file: `F8`

### Python
- execute: `F5`

### Latex
- toggle continuous compile mode: `<leader>ll`
- preview: `<leader>lv`

### nerdtree
- toggle: `<leader><leader>`
- go to the next/previous tab: `<leader>j` / `<leader>f`

### Snippets
- expand: `Ctrl` + `l`

### FZF
- fuzzy finding (files): `<leader>t`

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

### Autocompletion

* [coc.nvim](https://github.com/neoclide/coc.nvim)

### Snippets

* [ultisnips](https://github.com/SirVer/ultisnips)
* [vim-snippets](https://github.com/honza/vim-snippets)

### Edit

* [nerdcommenter](https://github.com/scrooloose/nerdcommenter)
* [easymotion](https://github.com/gantheory/vim-easymotion)
* [vim-surround](https://github.com/tpope/vim-surround)
* [vim-repeat](https://github.com/tpope/vim-repeat)
* [vim-autoread](https://github.com/djoshea/vim-autoread)
* [delimitMate](https://github.com/Raimondi/delimitMate)
* [fzf](https://github.com/junegunn/fzf.vim)

### Git related

* [vim-signify](https://github.com/mhinz/vim-signify)

### Asynchronous linter

* [ale](https://github.com/w0rp/ale)

### Python related

* [python-syntax](https://github.com/hdima/python-syntax)
* [vim-python-pep8-indent](https://github.com/Vimjas/vim-python-pep8-indent)
* [SimpylFold](https://github.com/tmhedberg/SimpylFold)

### Clang format

* [vim-clang-format](https://github.com/rhysd/vim-clang-format)
