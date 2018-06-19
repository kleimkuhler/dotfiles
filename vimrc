set hidden  " hide abandoned buffers

set noswapfile      " don't use swap files
set nobackup        " don't use backup files
set undofile        " keep persistent undo
set undodir=/tmp    " where to store undo files

set autoindent  " use indentation of previous line
set smartindent " use intelligent indent

set expandtab     " expand TABs to spaces
set shiftwidth=2  " (auto)indent width
set softtabstop=2 " number of spaces TAB key expands to when editing
set tabstop=8     " number of spaces TAB key expands to (read man pages on why this is still 8)

set backspace=indent,eol,start  " backspace wraps over lines
set list                        " enable list mode
set listchars=tab:\ \           " TAB representation
set nowrap                      " do not wrap lines visually
set showmatch                   " highlight matching braces
set whichwrap+=<,>,h,l,[,]      " arrow keys and h/l wrap over lines

set number  " show line numbers
set ruler   " show column number

set wildmenu                    " better command completion
set wildignorecase              " ignore case in command completion
set wildmode=longest:full,full  " complete longest, alt, cycle

set ignorecase  " case insensitive search
set smartcase   " if an uppercase letter is in the query, be case sensitive
set incsearch   " show first match for the pattern, while still typing
set hlsearch    " highlight all matches for the pattern

set display+=lastline " show as much as possible of the last line
set scrolloff=2       " keep a few lines above/below cursor
set sidescrolloff=2   " keep a few columns left/right of the cursor
set sidescroll=1      " scroll horizontally by one column

" Map leader
let mapleader=" "

" Normal mode mappings
nnoremap <Space> <Nop>

" Insert mode mappings
inoremap fd <esc> " escape insert mode with fd

" Visual mode mappings
xnoremap < <gv  " stay in visual mode when left indenting
xnoremap > >gv  " stay in visual mode when right indenting

" Netrw settings
let g:netrw_banner = 0

syntax on             " syntax highlighting
set background=light  " use light background for solarized light
colorscheme solarized " set colorscheme to solarized

call plug#begin('~/.vim/plugged')

" Color theme
Plug 'altercation/vim-colors-solarized'

" Completion engine (for Rust!)
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --rust-completer' }

" Automatic :nohl when cursor is moved
Plug 'junegunn/vim-slash'

" Rust
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
let g:racer_experimental_completer = 1

call plug#end()
