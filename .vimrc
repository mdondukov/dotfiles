set number
set nocompatible
set tabstop=2
set shiftwidth=2
set smarttab
set expandtab
set softtabstop=2
set autoindent
set hlsearch
set clipboard=unnamed

" Use a line cursor within insert mode and a block cursor everywhere else.
"
" Reference chart of values:
"   Ps = 0  -> blinking block.
"   Ps = 1  -> blinking block (default).
"   Ps = 2  -> steady block.
"   Ps = 3  -> blinking underline.
"   Ps = 4  -> steady underline.
"   Ps = 5  -> blinking bar (xterm).
"   Ps = 6  -> steady bar (xterm).
let &t_SI = "\e[5 q"
let &t_EI = "\e[2 q"

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
set term=xterm-256color
set t_Co=256

set noshowmode

call plug#begin()

Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
"Plug 'joshdick/onedark.vim'

call plug#end()

let g:lightline = {'colorscheme': 'catppuccin_mocha'}
let g:airline_powerline_fonts = 1
let g:airline_theme = 'catppuccin_mocha'

colorscheme catppuccin_mocha

"let g:airline_theme='onedark'
"let g:airline_powerline_fonts = 1
"let g:lightline = {
"  \ 'colorscheme': 'onedark',
"  \ }

