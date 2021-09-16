local packer = require('packer')
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end

local use = packer.use

packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

packer.startup(function()
  use  { "wbthomason/packer.nvim", opt = false }

  -- lsp
  use "neovim/nvim-lspconfig"
  use "glepnir/lspsaga.nvim"
  use "onsails/lspkind-nvim"
  use "folke/lsp-trouble.nvim"

   -- Completion
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'L3MON4D3/LuaSnip',
      { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
      'hrsh7th/cmp-nvim-lsp',
      { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' },
      { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
      "hrsh7th/vim-vsnip",
      "hrsh7th/vim-vsnip-integ"
    },
  }

  -- git/scm
  use "lewis6991/gitsigns.nvim"
  use "kdheepak/lazygit.nvim"

  -- appereance
  use "projekt0n/github-nvim-theme"
  use { "folke/tokyonight.nvim", branch = "main" }
  use "kyazdani42/nvim-web-devicons"

  -- syntax
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }

  -- telescope
  use "nvim-telescope/telescope.nvim"
  use { "nvim-telescope/telescope-fzy-native.nvim", run="git submodule update --init --recursive" }
  use "ahmedkhalf/project.nvim"

  -- workflow
  use "folke/which-key.nvim"
  use "djoshea/vim-autoread"
  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"
  use "windwp/nvim-autopairs"
  use "oberblastmeister/rooter.nvim"
  use "tpope/vim-commentary"
  use "tpope/vim-surround"
  use "machakann/vim-highlightedyank"
  use { "mg979/vim-visual-multi", branch = "master" }
  use "norcalli/nvim-colorizer.lua"
  use "glepnir/dashboard-nvim"
  use "RRethy/vim-illuminate"
  use "folke/zen-mode.nvim"
  use "kyazdani42/nvim-tree.lua"

  -- bars and lines
  use { "glepnir/galaxyline.nvim" , branch = "main" }
  use "romgrk/barbar.nvim"

  -- formater
  use { "prettier/vim-prettier", run = "npm install" }
  use "mhartington/formatter.nvim"
end)




