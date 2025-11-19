" ============================================
" Lightweight Vim Configuration for Server
" GitHub Dark Theme
" ============================================

" Basic Settings
" ============================================
set nocompatible              " Disable vi compatibility
filetype plugin indent on     " Enable filetype detection
syntax on                     " Enable syntax highlighting

" Display Settings
" ============================================
set number                    " Show line numbers
set relativenumber            " Relative line numbers
set ruler                     " Show cursor position
set showcmd                   " Show command in status line
set showmode                  " Show current mode
set laststatus=2              " Always show status line
set cursorline                " Highlight current line
set scrolloff=8               " Keep 8 lines above/below cursor
set sidescrolloff=8           " Keep 8 columns left/right of cursor
set wrap                      " Wrap long lines
set linebreak                 " Break lines at word boundaries

" Search Settings
" ============================================
set incsearch                 " Incremental search
set hlsearch                  " Highlight search results
set ignorecase                " Ignore case when searching
set smartcase                 " Smart case (override ignorecase if uppercase used)

" Indentation Settings
" ============================================
set autoindent                " Auto indent
set smartindent               " Smart indent
set expandtab                 " Use spaces instead of tabs
set tabstop=4                 " Tab width
set shiftwidth=4              " Indent width
set softtabstop=4             " Tab width when editing
set shiftround                " Round indent to multiple of shiftwidth

" Performance
" ============================================
set lazyredraw                " Don't redraw while executing macros
set ttyfast                   " Fast terminal connection
set updatetime=300            " Faster completion

" File Handling
" ============================================
set noswapfile                " Disable swap files
set nobackup                  " Disable backup files
set nowritebackup             " Disable backup before writing
set autoread                  " Auto reload changed files
set encoding=utf-8            " UTF-8 encoding
set fileencoding=utf-8        " File encoding

" Editor Behavior
" ============================================
set backspace=indent,eol,start " Backspace works everywhere
set mouse=a                   " Enable mouse support
set hidden                    " Allow hidden buffers
set history=1000              " Command history
set undolevels=1000           " Undo history
set wildmenu                  " Command-line completion
set wildmode=longest:full,full " Completion mode
set completeopt=menu,menuone,noselect " Completion options

" Split Behavior
" ============================================
set splitbelow                " Horizontal splits below
set splitright                " Vertical splits right

" ============================================
" Cursor Shape Configuration
" ============================================
" Block cursor in all modes (Normal, Visual, Command, Insert)
let &t_SI = "\e[2 q"          " Insert mode: block (2 = block)
let &t_EI = "\e[2 q"          " Normal mode: block
let &t_SR = "\e[2 q"          " Replace mode: block

" Alternative: if your terminal doesn't support the above
" Try these escape sequences
if exists('$TMUX')
    " tmux escape sequences
    let &t_SI = "\<Esc>Ptmux;\<Esc>\e[2 q\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\e[2 q\<Esc>\\"
    let &t_SR = "\<Esc>Ptmux;\<Esc>\e[2 q\<Esc>\\"
endif

" ============================================
" GitHub Dark Color Scheme
" ============================================
" Background and foreground
set background=dark

" Enable true color support (with tmux compatibility)
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Force termguicolors in tmux with proper $TERM
if exists('$TMUX')
  if $TERM == 'tmux-256color' || $TERM == 'screen-256color'
    set termguicolors
  endif
endif

" GitHub Dark color palette
let g:github_dark_bg = '#0d1117'
let g:github_dark_surface = '#161b22'
let g:github_dark_fg = '#c9d1d9'
let g:github_dark_muted = '#8b949e'
let g:github_dark_blue = '#58a6ff'
let g:github_dark_green = '#3fb950'
let g:github_dark_red = '#f85149'
let g:github_dark_yellow = '#d29922'
let g:github_dark_purple = '#bc8cff'
let g:github_dark_cyan = '#39c5cf'

" Apply GitHub Dark colors
highlight Normal guibg=#0d1117 guifg=#c9d1d9 ctermbg=NONE ctermfg=251
highlight LineNr guibg=#0d1117 guifg=#8b949e ctermfg=245
highlight CursorLine guibg=#161b22 ctermbg=235
highlight CursorLineNr guibg=#161b22 guifg=#58a6ff gui=bold ctermfg=75 cterm=bold
highlight Visual guibg=#1f6feb guifg=#c9d1d9 ctermbg=27 ctermfg=251
highlight Search guibg=#d29922 guifg=#0d1117 ctermbg=178 ctermfg=234
highlight IncSearch guibg=#f85149 guifg=#0d1117 ctermbg=203 ctermfg=234
highlight StatusLine guibg=#161b22 guifg=#c9d1d9 gui=NONE ctermbg=235 ctermfg=251
highlight StatusLineNC guibg=#0d1117 guifg=#8b949e ctermbg=234 ctermfg=245
highlight VertSplit guibg=#0d1117 guifg=#161b22 ctermbg=234 ctermfg=235
highlight Pmenu guibg=#161b22 guifg=#c9d1d9 ctermbg=235 ctermfg=251
highlight PmenuSel guibg=#1f6feb guifg=#c9d1d9 ctermbg=27 ctermfg=251
highlight TabLine guibg=#0d1117 guifg=#8b949e ctermbg=234 ctermfg=245
highlight TabLineSel guibg=#161b22 guifg=#58a6ff ctermbg=235 ctermfg=75
highlight TabLineFill guibg=#0d1117 ctermbg=234

" Syntax highlighting colors
highlight Comment guifg=#8b949e ctermfg=245
highlight Constant guifg=#bc8cff ctermfg=141
highlight String guifg=#a5d6ff ctermfg=153
highlight Character guifg=#a5d6ff ctermfg=153
highlight Number guifg=#bc8cff ctermfg=141
highlight Boolean guifg=#bc8cff ctermfg=141
highlight Float guifg=#bc8cff ctermfg=141
highlight Identifier guifg=#c9d1d9 ctermfg=251
highlight Function guifg=#d2a8ff ctermfg=183
highlight Statement guifg=#ff7b72 ctermfg=209
highlight Conditional guifg=#ff7b72 ctermfg=209
highlight Repeat guifg=#ff7b72 ctermfg=209
highlight Label guifg=#ff7b72 ctermfg=209
highlight Operator guifg=#ff7b72 ctermfg=209
highlight Keyword guifg=#ff7b72 ctermfg=209
highlight Exception guifg=#ff7b72 ctermfg=209
highlight PreProc guifg=#d2a8ff ctermfg=183
highlight Include guifg=#d2a8ff ctermfg=183
highlight Define guifg=#d2a8ff ctermfg=183
highlight Macro guifg=#d2a8ff ctermfg=183
highlight PreCondit guifg=#d2a8ff ctermfg=183
highlight Type guifg=#79c0ff ctermfg=117
highlight StorageClass guifg=#79c0ff ctermfg=117
highlight Structure guifg=#79c0ff ctermfg=117
highlight Typedef guifg=#79c0ff ctermfg=117
highlight Special guifg=#39c5cf ctermfg=80
highlight SpecialChar guifg=#39c5cf ctermfg=80
highlight Delimiter guifg=#c9d1d9 ctermfg=251
highlight SpecialComment guifg=#8b949e ctermfg=245
highlight Debug guifg=#f85149 ctermfg=203
highlight Underlined guifg=#58a6ff gui=underline ctermfg=75 cterm=underline
highlight Error guibg=#f85149 guifg=#0d1117 ctermbg=203 ctermfg=234
highlight Todo guibg=#d29922 guifg=#0d1117 ctermbg=178 ctermfg=234
highlight Directory guifg=#58a6ff ctermfg=75
highlight Title guifg=#58a6ff gui=bold ctermfg=75 cterm=bold
highlight MatchParen guibg=#3fb950 guifg=#0d1117 ctermbg=71 ctermfg=234

" Diff colors
highlight DiffAdd guibg=#1a4d2e guifg=#3fb950 ctermbg=22 ctermfg=71
highlight DiffChange guibg=#1f3a5f guifg=#58a6ff ctermbg=17 ctermfg=75
highlight DiffDelete guibg=#5a1e1e guifg=#f85149 ctermbg=52 ctermfg=203
highlight DiffText guibg=#2e5a88 guifg=#c9d1d9 ctermbg=24 ctermfg=251

" ============================================
" Key Mappings
" ============================================
" Set leader key to space
let mapleader = " "

" Quick save
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>a

" Quick quit
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :qa!<CR>

" Clear search highlighting
nnoremap <Esc><Esc> :nohlsearch<CR>

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Resize windows
nnoremap <C-Up> :resize +2<CR>
nnoremap <C-Down> :resize -2<CR>
nnoremap <C-Left> :vertical resize -2<CR>
nnoremap <C-Right> :vertical resize +2<CR>

" Buffer navigation
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>
nnoremap <leader>bd :bdelete<CR>

" Better indenting in visual mode
vnoremap < <gv
vnoremap > >gv

" Move selected lines up/down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" ============================================
" OSC 52 Clipboard Support (works over SSH!)
" ============================================
" OSC 52 copy function - sends text to local terminal clipboard via escape codes
function! Osc52Yank()
    let buffer=system('base64 -w0', @0)
    let buffer=substitute(buffer, "\n$", "", "")
    let buffer='\e]52;c;'.buffer.'\x07'
    silent exe "!echo -ne ".shellescape(buffer)." > ".shellescape('/dev/tty')
endfunction

" Copy to system clipboard using OSC 52
vnoremap <leader>y y:call Osc52Yank()<CR>
nnoremap <leader>Y yg_:call Osc52Yank()<CR>
nnoremap <leader>yy yy:call Osc52Yank()<CR>

" Paste from system clipboard (requires terminal support)
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" Toggle relative line numbers
nnoremap <leader>rn :set relativenumber!<CR>

" ============================================
" Auto Commands
" ============================================
if has("autocmd")
    " Return to last edit position when opening files
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif

    " Remove trailing whitespace on save
    autocmd BufWritePre * :%s/\s\+$//e

    " Auto-resize splits when window is resized
    autocmd VimResized * wincmd =
endif

" ============================================
" Status Line
" ============================================
set statusline=
set statusline+=\ %f                    " File path
set statusline+=\ %m                    " Modified flag
set statusline+=\ %r                    " Readonly flag
set statusline+=%=                      " Right align
set statusline+=\ %y                    " File type
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\ [%{&fileformat}]      " File format
set statusline+=\ %p%%                  " Percentage through file
set statusline+=\ %l:%c                 " Line:Column
set statusline+=\

" ============================================
" File Type Specific Settings
" ============================================
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType yml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType json setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType typescript setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
autocmd FileType go setlocal ts=4 sts=4 sw=4 noexpandtab
autocmd FileType markdown setlocal ts=2 sts=2 sw=2 expandtab wrap spell

" ============================================
" Tips
" ============================================
" Leader key is <Space>
" <Space>q - Quick quit
" <Space>y - Copy to system clipboard (visual mode)
" <Space>p - Paste from system clipboard
" <Space>rn - Toggle relative line numbers
" <Ctrl-s> - Save file
" <Esc><Esc> - Clear search highlighting
" <Ctrl-h/j/k/l> - Navigate between splits (works with tmux)
