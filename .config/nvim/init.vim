call plug#begin('~/.vim/plugged')

"Plug 'mattn/emmet-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'google/vim-searchindex'
Plug 'Valloric/MatchTagAlways'
Plug 'sheerun/vim-polyglot'
"Plug 'tpope/vim-markdown', { 'for': 'markdown' }
"Plug 'junegunn/goyo.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"Plug 'w0rp/ale'
"Plug 'moll/vim-node'
"Plug 'posva/vim-vue'
Plug 'scrooloose/nerdtree'
"Plug 'Shougo/deoplete.nvim', { 'do': 'UpdateRemotePlugins' }
Plug 'vim-airline/vim-airline'
"Plug 'othree/html5.vim'
"Plug 'hail2u/vim-css3-syntax'
"Plug 'othree/csscomplete.vim'
"Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
Plug 'ap/vim-css-color'
"Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-surround'
Plug 'srcery-colors/srcery-vim'

call plug#end()

set keywordprg=:help

" split on replace
set inccommand=split

" Git changes
set updatetime=250

" No fillchars
set fillchars=""

" Diff ignore whitespaces
set diffopt+=iwhite

" Automatically deletes all tralling whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Disable automatic commenting on newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
"
" automatically read changes in the file
set autoread

" no wrap
set nowrap

" visual bell
set vb

" change buffers without saving
set hidden

" no highlight line and column
set nocursorline
set nocursorcolumn

" splits
set splitbelow
set splitright

" scroll fast
set ttyfast

" encoding
set fileencoding=utf-8
set encoding=utf-8

" tab size
set shiftwidth=2
set tabstop=2
set softtabstop=2
autocmd FileType python setlocal shiftwidth=4 softtabstop=4 tabstop=8

" tabs = spaces
set expandtab

" backspace behavior
set backspace=indent,eol,start

" turn syntax highlight on
syntax on

" automatic indentation
filetype plugin indent on

" line numbers
set number
set relativenumber

" incremental search
set incsearch
set hlsearch
set ignorecase
set smartcase

" turn off the highlight search
nmap <silent> <Space>n :nohls<CR>

" leader key
let mapleader="\<Space>"

" no swap files
set nobackup
set noswapfile

" show commands
set showcmd

" shell
if exists('$SHELL')
  set shell=$SHELL
else
  set shell=/bin/sh
endif

" colorscheme
colorscheme srcery

" ruler
let &colorcolumn="80"

" disable mouse
" set mousemodel=popup
" set mousehide

" disable menus
set guioptions=egmrti

" disable the blinking cursor
set gcr=a:blinkon0

" lines below and above cursor
set scrolloff=5

" status bar
set laststatus=2

" fugitive statusline
if exists("*fugitive#statusline")
  set statusline+=%(fugitive#statusline())
endif

" syntax highlight syncing from start unless 200 lines
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync maxlines=200
augroup END

" remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
augroup END

" opens an edit command with the path of the currently edited file filled in
noremap <leader>e :e <C-R>=expand("%:p:h") , "/" <CR>

" Buffer nav
noremap <leader>z :bp<CR>
noremap <leader>x :bn<CR>

" Close buffer
noremap <leader>q :bd<CR>

" set working directory
nnoremap <leader>. :lcd %:p:h<CR>

" clipboard
set clipboard=unnamed,unnamedplus

" switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

if bufwinnr(1)
  map + <C-W>+
  map - <C-W>-
  map <C-x> <C-W><
  map <C-z> <C-W>>
endif

" vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

" fix css highlight problems
augroup VimCSS3Syntax
  autocmd!
  autocmd FileType css setlocal iskeyword+=-
  autocmd FileType scss set iskeyword+=-
augroup END

nnoremap <silent> <leader>f :FZF<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <leader>a :Ag<Space>

" airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'srcery'
let g:airline_skip_empty_sections = 1

" nerdtree
map <C-n> :NERDTreeToggle<CR>

"" emmet key
"let g:user_emmet_leader_key=','

"" deoplete
"let g:deoplete#enable_at_startup = 1

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>F  <Plug>(coc-format-selected)
nmap <leader>F  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
