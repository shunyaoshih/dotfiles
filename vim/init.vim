""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Maintainer: Gary Shih
"
" Sections:
"     -> basic settings
"     -> basic mappings
"     -> vim plugins
"     -> plugins' settings
"     -> other useful functions or mappings
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" basic settings {{{
" change leader
let mapleader = ' '
let maplocalleader = ' '
let g:mapleader = ' '
let g:maplocalleader = ' '

" enable syntax highlighting
syntax on

" cursorline make vim slow when scrolling
set cursorline

filetype plugin indent on " make filetype plugin enable
set mouse=a

set background=dark
set shell=$SHELL " shell
if has('termguicolors')
  set termguicolors " true color support
endif
set autoread " set to auto read when a file is changed from the outside
set history=500 " set how many lines neovim should remember
set pastetoggle=<F2>  " switch paste mode

set ignorecase " /the would find 'the' or 'The', add \C if you want 'the' only
set smartcase " while /The would find only 'The' etc.

set visualbell t_vb= " disable sound

set noshowmode " do not display current mode

set virtualedit=block " the cursor can be positioned where there is no actual
                      " character in the visual mode.

set hlsearch " highlight search thins
set incsearch " search act lke search in modern browsers
set laststatus=2 " Always show the statusline

set wrap " wrap lines

set clipboard+=unnamed " vim use the system clipboard by default

set fileencodings=utf8
set encoding=utf8

" no annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" line numbers
set number " show line numbers
set rnu " show relative line numbers: may make vim slow when scrolling
set numberwidth=4 " line numbers width

" how many characters in a line
set textwidth=0 " make it obvious where 80 characters is
set colorcolumn=80 " color column after 'textwidth

set nobackup " no back up file
set noswapfile " you can open the same file in different places

" tab and spaces
set tabstop=2     " tab width
set shiftwidth=2  " indent size
set softtabstop=2
set expandtab     " spaces on tab press
" set smartindent   " indent automatically, based on autoindent
set cindent " smarter indent, remain the position what you just add comment one a new line
set shiftround    " uses shiftwidth when >, <
set list listchars=tab:»·,trail:· " show tab and trailing whitespaces

" pesistent undo
set undodir=~/.vim/.undodir
set undofile

" use your own cursor
set guicursor=

" Treat long lines as break lines (useful when moving around in them)
" wrap function {{{
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
    nnoremap  <buffer> <silent> k gk
    nnoremap  <buffer> <silent> j gj
    nnoremap  <buffer> <silent> 0 g^
    nnoremap  <buffer> <silent> $ g$
    nnoremap  <buffer> <silent> <Up>   gk
    nnoremap  <buffer> <silent> <Down> gj
    nnoremap  <buffer> <silent> <Home> g<Home>
    nnoremap  <buffer> <silent> <End>  g<End>
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
au BufRead,BufNewFile * call SetWrapKeyMapping()

" let delete work in OS X
set backspace=2

" folding method
set foldmethod=marker

" split to the right wiht :vs
set splitright

" for macvim
set guifont=Monaco\ for\ Powerline:h13
let g:nerdtree_tabs_open_on_gui_startup = 0
" }}}
" vim plugins {{{
call plug#begin()
" color theme
Plug 'leomao/pikacode.vim' " colorscheme
Plug 'itchyny/lightline.vim' " lightline
Plug 'leomao/lightline-pika' " pika settings of lightline

" file explorer
Plug 'scrooloose/nerdtree' " file tree
Plug 'jistr/vim-nerdtree-tabs' " all tabs share one nerdtree
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }

" auto-complete
function! BuildYCM(info)
  if a:info.status == 'installed' || a:info.force
    !./install.py --clang-completer
  endif
endfunction
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }

" snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" edit
Plug 'scrooloose/nerdcommenter' " powerful commenter
Plug 'easymotion/vim-easymotion' " fast motion
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

" git related
Plug 'tpope/vim-fugitive' " git commands
Plug 'junegunn/gv.vim' " git commit brows
Plug 'mhinz/vim-signify' " asynchronously show diff

" asynchronous linter
Plug 'w0rp/ale'

" python related
Plug 'leomao/python-syntax', { 'for': 'python' } " python syntax highlighting
Plug 'hynek/vim-python-pep8-indent', { 'for': 'python' } " python indentation

" latex related
Plug 'lervag/vimtex', { 'for': 'tex' }

" markdown preview
if has('mac')
  Plug 'junegunn/vim-xmark', { 'do': 'make' }
endif

call plug#end()
" }}}
" plugins' settings {{{
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
colorscheme pikacode
" }}}
" nerdtree {{{
" open new vertical split window: s
" open new horizontal split window: i
" open the current directory: o
" close the current directory: x
" move between windows: <C-w(hjkl)>
" move between tabs: gt, gT
" change the tree root to the selected dir: C
" move the tree root up one directory( the old node left open ): U
" show .file: I
" show nerdtree in the full screen: A
" set width of nerdtree window
let g:NERDTreeWinSize = 25
nmap <leader>f gT
nmap <leader>j gt
" }}}
" nerdtree tabs {{{
" open nerdtree for all tabs
map <leader><leader> :NERDTreeTabsToggle<CR>
" }}}
" tagbar {{{
nnoremap <silent> <leader>t :TagbarToggle<CR>
let g:tagbar_left = 0
let g:tagbar_width = 25
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 0
" }}}
" YouCompleteMe {{{
let g:ycm_key_list_select_completion = ['<TAB>']
let g:ycm_key_list_previous_completion = []
let g:ycm_min_num_of_chars_for_completion = 5
" }}}
" snippets {{{
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<c-j>"
" }}}
" nerdcommenter {{{
" <leader>cc => comment
" <leader>cu => uncomment
let g:NERDSpaceDelims = 1
let g:NERDRemoveExtraSpaces = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" }}}
" vim-easymotion {{{
" change default trigger
map <leader> <Plug>(easymotion-prefix)
" <leader>f{char} to move to {char}
" map  <leader>f <Plug>(easymotion-bd-f)
" nmap <leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap <leader>s <Plug>(easymotion-overwin-f2)

" Move to line
map <leader>l <Plug>(easymotion-bd-jk)
nmap <leader>l <Plug>(easymotion-overwin-line)

" Move to word
" map  <leader>w <Plug>(easymotion-bd-w)
" nmap <leader>w <Plug>(easymotion-overwin-w)
" }}}
" vim-signify {{{
let g:signify_vcs_list = ['git']
" }}}
" ale {{{
let g:ale_lint_delay = 1000
let g:ale_sign_error = '✗'
let g:ale_sign_warning = 'ø'
nmap ]f <Plug>(ale_next_wrap)
nmap [f <Plug>(ale_previous_wrap)
let g:ale_linters = {
\   'python': [''],
\}
" }}}
" python {{{
let python_highlight_all = 1
" }}}
" vimtex {{{
let g:vimtex_compiler_latexmk = {'callback' : 0}
" <leader>ll toggle for compile on save
" }}}
" }}}
" basic mappings {{{
" save (and quit) files
nnoremap <leader>w :w<CR>
nnoremap <leader>x :x<CR>
nnoremap <leader>q :q!<CR>

" exchange 0, ^
noremap 0 ^
noremap ^ 0

" toggle for wrapping lines
noremap <silent><F3> :call ToggleWrap()<CR>

" easy moving of code blocks, better indentation
vnoremap < <gv
vnoremap > >gv

" Make Y behave like other capitals
nnoremap Y y$

" use Macro easily
nnoremap Q @q
" }}}
" other useful functions or mappings {{{
" remove trailing spaces {{{
nnoremap <silent> <leader>rt :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
" }}}
" clear highliht {{{
noremap <leader>nh :noh<CR>
" }}}
" reload file {{{
noremap <leader>e :edit<CR>
" }}}
" show highlight groups {{{
nmap <leader>sh :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") .
\ '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
" }}}
" copy full path {{{
noremap <leader>pw :let @+ = expand('%:p')<CR>
" }}}
" copy full path without the file name {{{
noremap <leader>po :let @+ = expand('%:p:h')<CR>
" }}}
" insert and delete empty line in normal mode {{{
function! AddEmptyLineBelow()
  call append(line("."), "")
endfunction

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

noremap <silent> ∆ :call DelEmptyLineBelow()<CR>
noremap <silent> ˚ :call DelEmptyLineAbove()<CR>
noremap <silent> <C-j> :call AddEmptyLineBelow()<CR>
noremap <silent> <C-k> :call AddEmptyLineAbove()<CR>
" }}}
" }}}