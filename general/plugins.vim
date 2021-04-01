
filetype plugin on

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  AUTOcmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
    " themes
    Plug 'arcticicestudio/nord-vim'
    Plug 'sainnhe/gruvbox-material'
    Plug 'gruvbox-community/gruvbox'
    Plug 'drewtempelmeyer/palenight.vim'
    Plug 'arcticicestudio/nord-tmux'
    Plug 'tomasiser/vim-code-dark'
    Plug 'mkitt/tabline.vim'
    Plug 'ryanoasis/vim-devicons'
    Plug 'doums/darcula'
    Plug 'vwxyutarooo/nerdtree-devicons-syntax'

    " appearence
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " general workflow 
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-obsession'
    Plug 'tpope/vim-surround'
    Plug 'junegunn/goyo.vim'
    Plug 'chaoren/vim-wordmotion'
    Plug 'djoshea/vim-autoread'
    Plug 'machakann/vim-highlightedyank'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'vifm/vifm.vim'
    Plug 'gcmt/taboo.vim'
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'reedes/vim-pencil'
 
    " file management
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'airblade/vim-rooter'
    Plug 'preservim/nerdtree'
    Plug 'git@github.com:mbbill/undotree.git'

    " LSP
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " Language
    Plug 'sheerun/vim-polyglot'
    " Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

    " git
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'idanarye/vim-merginal'
    Plug 'junegunn/gv.vim'
    Plug 'kdheepak/lazygit.nvim'

    " window managment
    Plug 'christoomey/vim-tmux-navigator'

    " language
    Plug 'pangloss/vim-javascript'    " JavaScript support
    Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
    Plug 'HerringtonDarkholme/yats.vim'

    " formater
    Plug 'prettier/vim-prettier', { 'do': 'npm install' }

 call plug#end()
