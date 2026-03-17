set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
filetype plugin indent on   "allow auto-indenting depending on file type
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim

" Behavior for all files (Defaults)
set colorcolumn=80 
set wrap                " Visually wrap long lines
set linebreak           " Wrap at whole words, not in the middle of a word
set smartindent         " 'si' - Good for coding
set textwidth=80        " 'tw' - Hard break at 80 chars

" Exception for Markdown/Text (Prose)
" This turns OFF the physical line breaks so your files look good in iA Writer
autocmd FileType markdown,text setlocal textwidth=0

" Plugin Section
filetype plugin on
call plug#begin()
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-unimpaired'
Plug 'morhetz/gruvbox'
call plug#end()

" open new split panes to right and below
set splitright
set splitbelow

vnoremap <A-k> :m '<-2<CR>gv=gv
" move split panes to left/bottom/top/right
nnoremap <A-h> <C-W>H
nnoremap <A-j> <C-W>J
nnoremap <A-k> <C-W>K
nnoremap <A-l> <C-W>L
" move between panes to left/bottom/top/right
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Press i to enter insert mode, and ii to exit insert mode.
:inoremap ii <Esc>
:inoremap jk <Esc>
:inoremap kj <Esc>
:vnoremap jk <Esc>
:vnoremap kj <Esc>

" Allow terminal themes to come through
" color schemes
colorscheme gruvbox
set termguicolors
syntax on
set background=dark
highlight ColorColumn guibg=#d65d0e guifg=NONE
