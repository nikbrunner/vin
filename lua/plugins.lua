local packer = require( "packer" )
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath( "data" ) ..
                         "/site/pack/packer/start/packer.nvim"

-- Bootstraping Packer if not already installed
-- https://github.com/wbthomason/packer.nvim#bootstrapping
if fn.empty( fn.glob( install_path ) ) > 0 then
  execute(
      "!git clone https://github.com/wbthomason/packer.nvim " .. install_path
   )
  execute "packadd packer.nvim"
end

-- Auto source when there are changes in plugins.lua
local au = require( "au" )
au.BufWritePost = { "plugins.lua", "source <afile> | PackerCompile" }

local use = packer.use

packer.init {
  display = {
    open_fn = function()
      return require( "packer.util" ).float { border = "rounded" }
    end
  }
}

packer.startup(
    function()
      use { "wbthomason/packer.nvim", opt = false }

      use {
        "neovim/nvim-lspconfig",
        config = function()
          require( "plugins/lsp/bash" )
          require( "plugins/lsp/css" )
          require( "plugins/lsp/ts" )
        end
      }

      -- fork replacement for lspsaga
      use {
        "rinx/lspsaga.nvim",
        config = function()
          require( "plugins/lspsaga" )
        end
      }

      use {
        "onsails/lspkind-nvim",
        config = function()
          require( "plugins/kind" )
        end
      }

      use {
        "folke/lsp-trouble.nvim",
        config = function()
          require( "plugins/trouble" )
        end
      }

      use {
        "kyazdani42/nvim-tree.lua",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
          require( "plugins/nvimtree" )
        end
      }

      use {
        "projekt0n/circles.nvim",
        requires = {
          { "kyazdani42/nvim-web-devicons" },
          { "kyazdani42/nvim-tree.lua", opt = true }
        },
        config = function()
          require( "circles" ).setup()
        end
      }

      use {
        "hrsh7th/nvim-cmp",
        requires = {
          "L3MON4D3/LuaSnip",
          { "hrsh7th/cmp-buffer", after = "nvim-cmp" },
          { "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" },
          { "hrsh7th/cmp-path", after = "nvim-cmp" },
          { "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" },
          { "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" }
        },
        config = function()
          require( "plugins/cmp" );
        end
      }

      use {
        "lewis6991/gitsigns.nvim",
        config = function()
          require( "plugins/gitsigns" )
        end
      }

      use {
        "kdheepak/lazygit.nvim",
        config = function()
          require( "plugins/lazygit" )
        end
      }

      use {
        "projekt0n/github-nvim-theme",
        config = function()
          require( "plugins/github-nvim" )
        end
      }

      use {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
          require( "plugins/indent-blankline" )
        end
      }

      use {
        "folke/tokyonight.nvim",
        branch = "main",
        disable = true,
        config = function()
          require( "plugins/tokyonight" )
        end
      }

      use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = function()
          require( "plugins/treesitter" )
        end
      }

      use {
        "nvim-telescope/telescope.nvim",
        requires = { { "nvim-lua/plenary.nvim" } },
        config = function()
          require( "plugins/telescope" );
        end
      }

      use {
        "nvim-telescope/telescope-fzy-native.nvim",
        run = "git submodule update --init --recursive"
      }

      use {
        "ahmedkhalf/project.nvim",
        config = function()
          require( "plugins/projects" );
        end
      }

      use {
        "numToStr/Comment.nvim",
        config = function()
          require( "Comment" ).setup()
        end
      }

      use {
        "windwp/nvim-autopairs",
        config = function()
          require( "nvim-autopairs" ).setup {}
        end
      }

      use { "windwp/nvim-ts-autotag" }

      use {
        "karb94/neoscroll.nvim",
        config = function()
          require( "plugins/neoscroll" )
        end
      }

      use {
        "folke/which-key.nvim",
        config = function()
          require( "plugins/which-key" );
        end
      }

      use {
        "folke/zen-mode.nvim",
        config = function()
          require( "plugins/zen-mode" );
        end
      }

      use { "djoshea/vim-autoread" }

      use { "nvim-lua/popup.nvim" }

      use { "nvim-lua/plenary.nvim" }

      use {
        "oberblastmeister/rooter.nvim",
        config = function()
          require( "plugins/rooter" );
        end
      }

      use { "tpope/vim-commentary" }

      use { "tpope/vim-surround" }

      use {
        "machakann/vim-highlightedyank",
        config = function()
          require( "plugins/highlightedyank" );
        end
      }

      use { "mg979/vim-visual-multi", branch = "master" }

      use {
        "norcalli/nvim-colorizer.lua",
        config = function()
          require( "plugins/colorizer" );
        end
      }

      use {
        "glepnir/dashboard-nvim",
        config = function()
          require( "plugins/dashboard" );
        end
      }

      use { "RRethy/vim-illuminate" }

      use {
        "glepnir/galaxyline.nvim",
        branch = "main",
        config = function()
          require( "plugins/galaxyline" );
        end
      }

      use { "romgrk/barbar.nvim" }

      -- formater
      use { "prettier/vim-prettier", run = "npm install" }

      use {
        "andrejlevkovitch/vim-lua-format",
        event = "BufRead",
        ft = { "lua" },
        config = function()
          vim.cmd [[autocmd BufWrite *.lua call LuaFormat()]]
        end
      }

      use {
        "mhartington/formatter.nvim",
        config = function()
          require( "plugins/formatter" );
        end
      }

      use { "davidgranstrom/nvim-markdown-preview" }
    end
 )
