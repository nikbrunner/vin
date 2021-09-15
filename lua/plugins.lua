require "paq" {
  "savq/paq-nvim";

  -- lsp
  "neovim/nvim-lspconfig";
  "glepnir/lspsaga.nvim";
  "onsails/lspkind-nvim";
  "folke/lsp-trouble.nvim";

  "hrsh7th/nvim-cmp";
  "hrsh7th/cmp-buffer";
  "hrsh7th/cmp-nvim-lsp";
  "hrsh7th/cmp-path";
  "hrsh7th/cmp-nvim-lua";

  -- git/scm
  "lewis6991/gitsigns.nvim";
  "kdheepak/lazygit.nvim";

  -- appereance
  "projekt0n/github-nvim-theme";
  { "folke/tokyonight.nvim", branch = "main" };
  "kyazdani42/nvim-web-devicons";

  -- syntax
  { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" };

  -- telescope
  "nvim-telescope/telescope.nvim";
  { "nvim-telescope/telescope-fzy-native.nvim", run="git submodule update --init --recursive" };
  "ahmedkhalf/project.nvim";

  -- workflow
  "folke/which-key.nvim";
  "djoshea/vim-autoread";
  "nvim-lua/popup.nvim";
  "nvim-lua/plenary.nvim";
  "windwp/nvim-autopairs";
  "oberblastmeister/rooter.nvim";
  "tpope/vim-commentary";
  "tpope/vim-surround";
  "machakann/vim-highlightedyank";
  { "mg979/vim-visual-multi", branch = "master" };
  "norcalli/nvim-colorizer.lua";
  "glepnir/dashboard-nvim";
  "RRethy/vim-illuminate";
  "folke/zen-mode.nvim";
  "kyazdani42/nvim-tree.lua";

  -- bars and lines
  { "glepnir/galaxyline.nvim" , branch = "main" };
  "romgrk/barbar.nvim";

  -- formater
  { "prettier/vim-prettier", run = "npm install" };
  "mhartington/formatter.nvim";
}

