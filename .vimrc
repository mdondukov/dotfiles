" Minimal Vim Configuration for Server
set nocompatible
filetype plugin indent on
syntax on

" Display
set ruler
set showcmd
set laststatus=2
set nowrap
set background=dark

" Cursor shapes for different modes
let &t_SI = "\e[6 q"  " INSERT mode - vertical bar (thin line)
let &t_EI = "\e[2 q"  " NORMAL mode - block
let &t_SR = "\e[4 q"  " REPLACE mode - underline

" Search
set incsearch
set hlsearch
set ignorecase
set smartcase

" Indentation
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Performance
set lazyredraw
set ttyfast
set updatetime=300

" Files
set noswapfile
set nobackup
set encoding=utf-8
set autoread
set hidden

" Editor
set backspace=indent,eol,start
set mouse=a

" Splits
set splitbelow
set splitright

" Leader
let mapleader = " "

" Save/Quit
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>a
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :qa!<CR>

" Clear search
nnoremap <Esc><Esc> :nohlsearch<CR>

" Window navigation (works with tmux)
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Buffer navigation
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>
nnoremap <leader>bd :bdelete<CR>

" Better indenting
vnoremap < <gv
vnoremap > >gv

" OSC 52 Clipboard (works over SSH and inside tmux!)
function! Osc52Yank()
    let buffer=system('base64 -w0', @0)
    let buffer=substitute(buffer, "\n$", "", "")
    let buffer='\033]52;c;'.buffer.'\033\\'

    " Check if we're inside tmux
    if $TMUX != ''
        " Wrap in tmux passthrough
        let buffer = '\033Ptmux;\033'.buffer.'\033\\'
    endif

    " Send to terminal
    silent exe "!printf '".buffer."' > /dev/tty"
    redraw!
endfunction

vnoremap <leader>y y:call Osc52Yank()<CR>
nnoremap <leader>Y yg_:call Osc52Yank()<CR>
nnoremap <leader>yy yy:call Osc52Yank()<CR>
nnoremap <leader>p "+p
nnoremap <leader>P "+P

" Toggle paste mode (fixes indentation when pasting)
set pastetoggle=<F2>
nnoremap <leader>v :set paste<CR>i
nnoremap <leader>V :set nopaste<CR>

" Status line
set statusline=\ %f\ %m%=%y\ %p%%\ %l:%c\
