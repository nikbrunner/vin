syntax on

set encoding=UTF-8
let $LANG='en_US.UTF-8'
set clipboard+=unnamedplus
set guioptions-=e
set termguicolors
set sessionoptions+=tabpages,globals
set noerrorbells
set tabstop=2 
set softtabstop=2
set shiftwidth=2
set smarttab
set ignorecase
set smartcase
set cindent
set copyindent
set expandtab
set rnu nu
set nowrap
set hidden
set noswapfile
set nobackup
set lazyredraw
" set nocursorline
set cursorline
" set cursorcolumn
set incsearch
set nohlsearch
set scrolloff=16
set shortmess+=c
set tags=tags
set nocompatible
set mouse=a
set foldmethod=indent
set foldlevel=10
set cmdheight=1
set timeoutlen=750
set signcolumn=yes
set wildmode=longest,list,full
set splitbelow splitright

if executable("rg") 
    set grepprg=rg\ --vimgrep 
endif

" wildignore is now set dynamically via a dedicated script which get sourced
" in init.vim
" set wildignore+=node_modules/**,out/**,build/**,.next/**
