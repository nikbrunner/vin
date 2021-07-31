filetype plugin on

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  AUTOcmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
    " appereance
    Plug 'projekt0n/github-nvim-theme'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'ryanoasis/vim-devicons'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

    " workflow
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzy-native.nvim'
    Plug 'oberblastmeister/rooter.nvim'
    Plug 'mbbill/undotree'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'
    Plug 'chaoren/vim-wordmotion'
    Plug 'djoshea/vim-autoread'
    Plug 'machakann/vim-highlightedyank'
    Plug 'mg979/vim-visual-multi', {'branch': 'master'}
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'mhinz/vim-startify'
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npm install'  }
    Plug 'mileszs/ack.vim'
    Plug 'MattesGroeger/vim-bookmarks'
    Plug 'gennaro-tedesco/nvim-peekup'
    Plug 'SirVer/ultisnips'
    Plug 'mlaursen/vim-react-snippets'
    Plug 'windwp/nvim-autopairs'
    Plug 'windwp/nvim-ts-autotag'
    Plug 'RRethy/vim-illuminate'
    Plug 'folke/zen-mode.nvim'
    Plug 'kyazdani42/nvim-tree.lua'

    " tab & lines
    Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
    Plug 'romgrk/barbar.nvim'
 
    " lsp
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/nvim-compe'
    Plug 'glepnir/lspsaga.nvim'
    Plug 'folke/lsp-trouble.nvim'

    " git/scm
    Plug 'lewis6991/gitsigns.nvim'
    Plug 'kdheepak/lazygit.nvim'
    Plug 'sindrets/diffview.nvim'

    " formater
    Plug 'prettier/vim-prettier', { 'do': 'npm install' }
    Plug 'mhartington/formatter.nvim'
 call plug#end()
