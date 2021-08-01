local execute = vim.api.nvim_command
local fn = vim.fn

local packer_install_dir = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
local plug_url_format = 'https://github.com/%s'
local packer_repo = string.format(plug_url_format, 'wbthomason/packer.nvim')
local install_cmd = string.format('10split |term git clone --depth=1 %s %s', packer_repo, packer_install_dir)

if fn.empty(fn.glob(packer_install_dir)) > 0 then
  vim.api.nvim_echo({{'Installing packer.nvim', 'Type'}}, true, {})
  execute(install_cmd)
  execute 'packadd packer.nvim'
end

vim.cmd[[packadd packer.nvim]]

return require('packer').startup(function()
    -- lsp
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-compe'
    use 'glepnir/lspsaga.nvim'
    use 'folke/lsp-trouble.nvim'

    -- git/scm
    use 'lewis6991/gitsigns.nvim'
    use 'kdheepak/lazygit.nvim'
    use 'sindrets/diffview.nvim'

    -- appereance
    use 'projekt0n/github-nvim-theme'
    use 'kyazdani42/nvim-web-devicons'
    use 'ryanoasis/vim-devicons'
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    -- workflow
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-fzy-native.nvim'
    use 'oberblastmeister/rooter.nvim'
    use 'tpope/vim-commentary'
    use 'tpope/vim-surround'
    use 'chaoren/vim-wordmotion'
    use 'djoshea/vim-autoread'
    use 'machakann/vim-highlightedyank'
    use { 'mg979/vim-visual-multi', branch = 'master' }
    use 'norcalli/nvim-colorizer.lua'
    use 'glepnir/dashboard-nvim'
    use 'mileszs/ack.vim'
    use 'MattesGroeger/vim-bookmarks'
    use 'gennaro-tedesco/nvim-peekup'
    use 'SirVer/ultisnips'
    use 'mlaursen/vim-react-snippets'
    use 'windwp/nvim-autopairs'
    use 'windwp/nvim-ts-autotag'
    use 'RRethy/vim-illuminate'
    use 'folke/zen-mode.nvim'
    use 'kyazdani42/nvim-tree.lua'
    use { 'glepnir/galaxyline.nvim' , branch = 'main' }
    use 'romgrk/barbar.nvim'
    use 'kevinhwang91/nvim-bqf'
 
    -- formater
    use { 'prettier/vim-prettier', run = 'npm install' }
    use 'mhartington/formatter.nvim'
end)
