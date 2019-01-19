call plug#begin('~/.vim/plugged')

Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'google/vim-searchindex'
Plug 'Valloric/MatchTagAlways'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-markdown', { 'for': 'markdown' }
Plug 'junegunn/goyo.vim'
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'
Plug 'moll/vim-node'
Plug 'posva/vim-vue'
Plug 'scrooloose/nerdtree'
Plug 'Shougo/deoplete.nvim', { 'do': 'UpdateRemotePlugins' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'othree/html5.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'othree/csscomplete.vim'
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
Plug 'ap/vim-css-color'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-surround'

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
colorscheme seoul256
let g:seoul256_background = 239

" ruler
let &colorcolumn="80,".join(range(120,999),",")

" disable mouse
set mousemodel=popup
set mousehide

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

" emmet key
let g:user_emmet_leader_key=','

" fix css highlight problems
augroup VimCSS3Syntax
  autocmd!
  autocmd FileType css setlocal iskeyword+=-
  autocmd FileType scss set iskeyword+=-
augroup END

nnoremap <silent> <leader>f :FZF<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <leader>a :Ag<Space>

" vue
let g:vue_disable_pre_processors = 1

" deoplete
let g:deoplete#enable_at_startup = 1

" airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'cobalt2'
let g:airline_skip_empty_sections = 1

" nerdtree
map <C-n> :NERDTreeToggle<CR>

