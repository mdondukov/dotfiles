set number
set nocompatible
set tabstop=2
set shiftwidth=2
set smarttab
set expandtab
set softtabstop=2
set autoindent
set hlsearch

nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>

map <F2> <Esc>:w<CR>
map <F3> <Esc>:q!<CR>
map <F4> <Esc>:qw<CR>

syntax on
syntax enable
filetype off

set mousehide
set mouse=a

set termencoding=utf-8

set nobackup
set noswapfile
set encoding=utf-8
set fileencodings=utf8,cp1251

set visualbell t_vb=
set termguicolors

call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'joshdick/onedark.vim'

call plug#end()

colorscheme onedark

let g:airline_theme='onedark'
let g:airline_powerline_fonts = 1
let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ }

