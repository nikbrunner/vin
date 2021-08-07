require "paq" {
  'savq/paq-nvim';
  'neovim/nvim-lspconfig';
  'hrsh7th/nvim-compe';
  'glepnir/lspsaga.nvim';
  'folke/lsp-trouble.nvim';

  -- git/scm
  'lewis6991/gitsigns.nvim';
  'kdheepak/lazygit.nvim';
  'sindrets/diffview.nvim';

  -- appereance
  'projekt0n/github-nvim-theme';
  'kyazdani42/nvim-web-devicons';
  { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' };

  -- workflow
  'nvim-lua/popup.nvim';
  'nvim-lua/plenary.nvim';
  'nvim-telescope/telescope.nvim';
  'nvim-telescope/telescope-fzy-native.nvim';
  'oberblastmeister/rooter.nvim';
  'tpope/vim-commentary';
  'tpope/vim-surround';
  'machakann/vim-highlightedyank';
  { 'mg979/vim-visual-multi', branch = 'master' };
  'norcalli/nvim-colorizer.lua';
  'glepnir/dashboard-nvim';
  'RRethy/vim-illuminate';
  'folke/zen-mode.nvim';
  'kyazdani42/nvim-tree.lua';
  { 'glepnir/galaxyline.nvim' , branch = 'main' };
  'romgrk/barbar.nvim';
  'kevinhwang91/nvim-bqf';

  -- formater
  { 'prettier/vim-prettier', run = 'npm install' };
  'mhartington/formatter.nvim';
}

require("autocmd");
require("maps");
require("opts");

require("lsp/bash")
require("lsp/css")
require("lsp/ts")

require("plugs/bqf");
require("plugs/colorizer");
require("plugs/compe");
require("plugs/dashboard");
require("plugs/formatter");
require("plugs/galaxyline");
require("plugs/github-nvim");
require("plugs/gitsigns");
require("plugs/highlightedyank");
require("plugs/lazygit");
require("plugs/lspsaga")
require("plugs/nvimtree");
require("plugs/rooter");
require("plugs/telescope");
require("plugs/treesitter");
require("plugs/trouble");
require("plugs/zen-mode");
