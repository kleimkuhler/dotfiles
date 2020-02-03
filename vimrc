set shell=/bin/bash " fish does not work well with vim

" Automatically install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif     

" Load plugins
call plug#begin('~/.config/nvim/plugged')

" Color theme
Plug 'drewtempelmeyer/palenight.vim'

" Automatic :nohl when cursor is moved
Plug 'junegunn/vim-slash'

call plug#end()

set hidden  " hide abandoned buffers

set noswapfile      " don't use swap files
set nobackup        " don't use backup files
set undofile        " keep persistent undo
set undodir=/tmp    " where to store undo files

set autoindent  " use indentation of previous line
set smartindent " use intelligent indent

set expandtab     " expand TABs to spaces
set shiftwidth=4  " (auto)indent width
set softtabstop=4 " number of spaces TAB key expands to when editing
set tabstop=8     " number of spaces TAB key expands to (read man pages on why this is still 8)

set backspace=indent,eol,start  " backspace wraps over lines
set list                        " enable list mode
set listchars=tab:\ \           " TAB representation
set nowrap                      " do not wrap lines visually
set showmatch                   " highlight matching braces
set whichwrap+=<,>,h,l,[,]      " arrow keys and h/l wrap over lines

set number  " show line numbers
set ruler   " show column number

set laststatus=2    " always show status bar

set statusline=
set statusline+=%-10.3n\                     " buffer number
set statusline+=%f\                          " filename
set statusline+=%h%m%r%w                     " status flags
set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type
set statusline+=%=                           " right align remainder
set statusline+=%-14(%l,%c%V%)               " line, character
set statusline+=%<%P                         " file position

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
let mapleader="\<Space>"

" Default mappings
map H ^
map L $

" Normal mode mappings
nnoremap ; :

" Insert mode mappings
inoremap fd <esc> " escape insert mode with fd

" Visual mode mappings
xnoremap < <gv  " stay in visual mode when left indenting
xnoremap > >gv  " stay in visual mode when right indenting

" Netrw settings
let g:netrw_banner = 0

" Theme settings
if (has("termguicolors"))
  set termguicolors
endif

set background=dark
colorscheme palenight
syntax on   " syntax highlighting
