" Maintainer: Gary Shih
" Last updated: 2021-06-29

" Basic Settings {{{
let mapleader = ' '
let maplocalleader = ' '

" Show the screen line of the cursor. Useful to easily spot the cursor.
set cursorline

" Enable mouse in normal, visual, insert, and command-line mode.
set mouse=a

" Enable 24-bit RGB color.
set termguicolors " true color support

" When a file has been detected to have been changed outside of Vim and
" it has not been changed inside of Vim, automatically read it again.
set autoread

" Toggle for paste mode. Pasting text into a terminal running Vim
" with automatic indentation enabled can destroy the indentation
" of the pasted text.
set pastetoggle=<F2>

" A magic search method.
" See `:help ignorecase` and `:help smartcase` for more details.
set ignorecase
set smartcase

" Do not display mode in the bottom line.
set noshowmode

" Allow virtual editing in Visual block mode.
set virtualedit=block

" While typing a search command, show where the pattern, as it was typed
" so far, matches.  The matched string is highlighted.
set incsearch

" Let Neovim always use the system clipboard.
set clipboard+=unnamedplus

" Time in milliseconds to wait for a mapped sequence to complete.
set timeoutlen=500

" Show relative line number.
set relativenumber

" Show the colored column on the 80-th character.
set colorcolumn=80

" No backup mode.
set nobackup
set nowritebackup

" No swap file.
set noswapfile

" Number of spaces that a <Tab> in the file counts for.
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Use C indenting rules.
set cindent " smarter indent, remain the position what you just add comment one a new line

" Round indent to multiple of 'shiftwidth'.
set shiftround

" Show tab and trailing space as »· and ·.
set list listchars=tab:»·,trail:·

" Pesistent undo.
set undodir=~/.config/nvim/.undodir
set undofile

" Disable the cursor style configured by Neovim.
" Use the one configured by the terminal emulator.
set guicursor=

" Treat long lines as break lines (useful when moving around in them)
" Wrap function {{{
function! ToggleWrap()
  if &wrap
    echo "Wrap OFF"
    setlocal nowrap
  else
    echo "Wrap ON"
    setlocal wrap
    setlocal display+=lastline
  endif
  call SetWrapKeyMapping()
endfunction

function! SetWrapKeyMapping()
  if &wrap
    nnoremap <buffer> <silent> k gk
    nnoremap <buffer> <silent> j gj
    nnoremap <buffer> <silent> 0 g^
    nnoremap <buffer> <silent> $ g$
    nnoremap <buffer> <silent> <Up>   gk
    nnoremap <buffer> <silent> <Down> gj
    nnoremap <buffer> <silent> <Home> g<Home>
    nnoremap <buffer> <silent> <End>  g<End>
    inoremap <buffer> <silent> <Up>   <Esc>gka
    inoremap <buffer> <silent> <Down> <Esc>gja
    inoremap <buffer> <silent> <Home> <Esc>g<Home>i
    inoremap <buffer> <silent> <End>  <Esc>g<End>a
    onoremap <buffer> <silent> j gj
    onoremap <buffer> <silent> k gk
  else
    silent! nunmap <buffer> k
    silent! nunmap <buffer> j
    silent! nunmap <buffer> 0
    silent! nunmap <buffer> $
    silent! nunmap <buffer> <Up>
    silent! nunmap <buffer> <Down>
    silent! nunmap <buffer> <Home>
    silent! nunmap <buffer> <End>
    silent! iunmap <buffer> <Up>
    silent! iunmap <buffer> <Down>
    silent! iunmap <buffer> <Home>
    silent! iunmap <buffer> <End>
    silent! ounmap <buffer> j
    silent! ounmap <buffer> k
  endif
endfunction
" }}}
autocmd BufRead,BufNewFile * call SetWrapKeyMapping()

" Markers are used to specify folds.
set foldmethod=marker

" Split to the right with :vs (:vsplit).
set splitright

" Set scripts to be executable if the first line starts with "#!" or
" contains "/bin/"
autocmd BufWritePost * if getline(1) =~ "^#!" | if getline(1) =~ "/bin/" | silent execute "!chmod +x <afile>" | endif | endif

" Maximum number of suggestions shown in the popup menu.
set pumheight=5

" Keep the cursor on the same column if possible
" after executing some commands.
set nostartofline

" Use fzf in Vim.
set rtp+=/usr/local/opt/fzf

" Jump to the last position when reopening a file.
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Set Python used by Neovim.
let g:python3_host_prog = "/usr/local/bin/python3"
" }}}
" Neovim Plugins {{{
call plug#begin()

" Color theme.
Plug 'leomao/pikacode.vim'
Plug 'itchyny/lightline.vim'
Plug 'leomao/lightline-pika'

" Basic editing.
Plug 'scrooloose/nerdcommenter'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'djoshea/vim-autoread'
Plug 'Raimondi/delimitMate'
Plug 'Yggdroot/indentLine'
Plug 'mgee/lightline-bufferline'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Activity tracking.
Plug 'wakatime/vim-wakatime'

" Go.
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Rust.
Plug 'rust-lang/rust.vim'

runtime custom/local_plugin.vim

call plug#end()
" }}}
" Plugin Settings {{{
" pikatheme {{{
let g:lightline = {
      \ 'colorscheme': 'pikacode'
      \ }
let g:lightline_pika_patchfont = {
      \ 'leftsep': "\ue0b0",
      \ 'leftsubsep': "\ue0b1",
      \ 'rightsep': "\ue0b2",
      \ 'rightsubsep': "\ue0b3",
      \ 'branch': "\ue0a0",
      \ 'linecolumn': "\ue0a1",
      \ 'readonly': "\ue0a2",
      \ }
silent! colorscheme pikacode
" }}}
" nerdcommenter {{{
" <leader>cc => comment
" <leader>cu => uncomment
let g:NERDSpaceDelims = 1
let g:NERDRemoveExtraSpaces = 1
" Align line-wise comment delimiters flush left instead of
" following code indentation.
let g:NERDDefaultAlign = 'left'
" Workaround for 2 spaces in Python.
let g:NERDCustomDelimiters = {'python': {'left': '#'}}
map <leader>/ <plug>NERDCommenterToggle
" }}}
" vim-easymotion {{{
" Change default trigger.
map <leader> <Plug>(easymotion-prefix)

" <leader>s{char}{char} to move to {char}{char}
nmap <leader>s <Plug>(easymotion-overwin-f2)

" Move to line.
map <leader>l <Plug>(easymotion-bd-jk)
nmap <leader>l <Plug>(easymotion-overwin-line)

" Workaround for Easymotion cursor issue in Neovim.
autocmd OptionSet guicursor noautocmd set guicursor=
" }}}
" delimitMate {{{
autocmd FileType cpp let b:loaded_delimitMate = 1
autocmd FileType python let b:delimitMate_nesting_quotes = ['"']
autocmd FileType markdown let b:delimitMate_nesting_quotes = ['`']
" }}}
" indentLine {{{
let g:indentLine_char = '⎸'
let g:indentLine_concealcursor = ''
" }}}
" lightline-bufferline {{{
set showtabline=2
let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}
" }}}
" fzf {{{
nnoremap <leader>f :Files<CR>
nnoremap <leader>m :Marks<CR>
" }}}
" vim-go {{{
" Disable on-save operations.
let g:go_fmt_autosave = 0
let g:go_gopls_enabled = 0
let g:go_imports_autosave = 0
let g:go_mod_fmt_autosave = 0
let g:go_metalinter_autosave_enabled = []
" }}}
" }}}
" Basic Mappings {{{
" Save and quit files.
nnoremap <leader>w :w<CR>
nnoremap <leader>x :x<CR>
nnoremap <leader>q :q!<CR>
nnoremap <leader>a :qa!<CR>

noremap 0 ^
noremap ^ 0

" Toggle for wrapping lines.
noremap <silent><F3> :call ToggleWrap()<CR>

" Move code blocks easily.
vnoremap < <gv
vnoremap > >gv

" Make Y behave like other capitals.
nnoremap Y y$

" Use macro easily.
nnoremap Q @q

" Move buffers.
nnoremap <C-p> :bp<CR>
nnoremap <C-n> :bn<CR>
nnoremap <C-c> :bd<CR>
" }}}
" Useful Functions & Mappings {{{
" Clear highliht. {{{
noremap <leader>nh :noh<CR>
" }}}
" Show highlight groups. {{{
" nmap <leader>sh :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") .
" \ '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
" \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
" }}}
" Copy full path. {{{
noremap <leader>pw :let @+ = expand('%:p')<CR>
" }}}
" Copy full path without the file name. {{{
noremap <leader>po :let @+ = expand('%:p:h')<CR>
" }}}
" Insert & delete empty lines in normal mode. {{{
" Add empty line below. {{{
function! AddEmptyLineBelow()
  call append(line("."), "")
endfunction
" }}}
" Add empty line above. {{{
function! AddEmptyLineAbove()
  let l:scrolloffsave = &scrolloff
  " Avoid jerky scrolling with ^E at top of window
  set scrolloff=0
  call append(line(".") - 1, "")
  if winline() != winheight(0)
    silent normal! <C-e>
  end
  let &scrolloff = l:scrolloffsave
endfunction
" }}}
" Delete empty line below. {{{
function! DelEmptyLineBelow()
  if line(".") == line("$")
    return
  end
  let l:line = getline(line(".") + 1)
  if l:line =~ '^\s*$'
    let l:colsave = col(".")
    .+1d
    ''
    call cursor(line("."), l:colsave)
  end
endfunction
" }}}
" Delete empty line above. {{{
function! DelEmptyLineAbove()
  if line(".") == 1
    return
  end
  let l:line = getline(line(".") - 1)
  if l:line =~ '^\s*$'
    let l:colsave = col(".")
    .-1d
    silent normal! <C-y>
    call cursor(line("."), l:colsave)
  end
endfunction
" }}}
nnoremap <silent> <A-j> :call DelEmptyLineBelow()<CR>
nnoremap <silent> <A-k> :call DelEmptyLineAbove()<CR>
nnoremap <silent> <C-j> :call AddEmptyLineBelow()<CR>
nnoremap <silent> <C-k> :call AddEmptyLineAbove()<CR>
" }}}
" Move block up and down. {{{
vnoremap <S-j> :m'>+<CR>:echo "move block down"<CR>gv
vnoremap <S-k> :m'<-2<CR>:echo "move block up"<CR>gv
" }}}
" }}}
" Load Custom Settings {{{
runtime custom/local.vim
" }}}
