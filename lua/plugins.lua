local packer = require("packer")
local use = packer.use
local fn = vim.fn

local stdDataPath = fn.stdpath("data")
local packagePath = stdDataPath .. "/site/pack"
local install_path = packagePath .. "/packer/start/packer.nvim"

-- Bootstraping Packer if not already installed
-- https://github.com/wbthomason/packer.nvim#bootstrapping
if fn.empty(fn.glob(install_path)) > 0 then
  Packer_bootstrap = fn.system(
    { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
  )
end

-- Auto source when there are changes in plug-config.lua
require("auto").BufWritePost = { "plugins.lua", "source <afile> | PackerCompile" }

packer.reset()

packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end
  },
  ensure_dependencies = true,
  package_root = require("packer.util").join_paths(packagePath)
}

-- TODO Work with LuaRocks Support for Formater etc.
return packer.startup(
    function()
      use { "wbthomason/packer.nvim", opt = false }

      use {
        "neovim/nvim-lspconfig",
        config = function ()
          require("plug-config.lsp_config")
        end
      }

      use {
        "williamboman/nvim-lsp-installer",
        config = function()
          require("plug-config.lsp-installer")
        end
      }

      use {
        "hrsh7th/nvim-cmp",
        config = function()
          require("plug-config.completion");
        end
      }

      use { "L3MON4D3/LuaSnip" }
      use { "hrsh7th/cmp-buffer" }
      use { "hrsh7th/cmp-path" }
      use { "hrsh7th/cmp-nvim-lsp" }
      use { "hrsh7th/cmp-nvim-lua" }
      use { "saadparwaiz1/cmp_luasnip" }

      use {
        "folke/lua-dev.nvim",
        config = function()
          require("plug-config.lua-dev")
        end
      }

      -- NOTE fork replacement for lspsaga
      use {
        "rinx/lspsaga.nvim",
        config = function()
          require("plug-config.lspsaga")
        end
      }

      use {
        "onsails/lspkind-nvim",
        config = function()
          require("plug-config.kind")
        end
      }

      use {
        "folke/lsp-trouble.nvim",
        config = function()
          require("plug-config.trouble")
        end
      }

      use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = function()
          require("plug-config.treesitter")
        end
      }

      use {
        "ray-x/lsp_signature.nvim",
        config = function()
          require("lsp_signature").setup()
        end
      }

      use {
        "kyazdani42/nvim-tree.lua",
        requires = "kyazdani42/nvim-web-devicons",
        config = function() require("plug-config.nvimtree")
        end
      }

      use {
        "lewis6991/gitsigns.nvim",
        config = function()
          require("plug-config.gitsigns")
        end
      }

      use {
        "kevinhwang91/nvim-bqf",
        config = function()
          require("plug-config.nvim-bqf")
        end
      }

      use {
        "ThePrimeagen/harpoon",
        requires = { "nvim-lua/plenary.nvim" }
      }

      use {
        "kdheepak/lazygit.nvim",
        config = function()
          require("plug-config.lazygit")
        end
      }

      use {
        "projekt0n/github-nvim-theme",
        config = function()
          require("plug-config.github-nvim")
        end
      }

      use {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
          require("plug-config.indent-blankline")
        end
      }

      use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
          require("plug-config.todo")
        end
      }

      use {
        "nvim-telescope/telescope.nvim",
        requires = { { "nvim-lua/plenary.nvim" } },
        config = function()
          require("plug-config.telescope");
        end
      }

      use {
        "nvim-telescope/telescope-fzy-native.nvim",
        requires = { "nvim-telescope/telescope.nvim" },
        run = "git submodule update --init --recursive"
      }

      -- use {
      --   "nvim-telescope/telescope-github.nvim",
      --   requires = { "nvim-telescope/telescope.nvim" },
      -- }
      --
      use {
        "nikbrunner/telescope-github.nvim",
        requires = { "nvim-telescope/telescope.nvim" },
        branch = "add-browse_files"
      }

      use {
        "folke/which-key.nvim",
        config = function()
          require("plug-config.whichkey");
        end
      }

      use {
        "nvim-telescope/telescope-project.nvim"
      }

      use {
        "numToStr/Comment.nvim",
        config = function()
          require("Comment").setup()
        end
      }

      use {
        "wellle/targets.vim"
      }

      use { "windwp/nvim-autopairs",
        config = function()
          require("nvim-autopairs").setup {}
        end
      }

      use {
        "karb94/neoscroll.nvim",
        config = function()
          require("plug-config.neoscroll")
        end
      }

      use {
        "folke/zen-mode.nvim",
        config = function()
          require("plug-config.zen-mode");
        end
      }

      use {
        "machakann/vim-highlightedyank",
        config = function()
          require("plug-config.highlightedyank")
        end
      }

      use {
        "norcalli/nvim-colorizer.lua",
        config = function()
          require("plug-config.colorizer")
        end
      }

      use {
        "glepnir/dashboard-nvim",
        config = function()
          require("plug-config.dashboard")
        end
      }

      use {
        "glepnir/galaxyline.nvim",
        branch = "main",
        config = function()
          require("plug-config.statusline")
        end
      }

      use {
        "romgrk/barbar.nvim",
        requires = { "kyazdani42/nvim-web-devicons" },
        config = function()
          require("plug-config.barbar")
        end
      }

      use {
        "andrejlevkovitch/vim-lua-format",
        event = "BufRead",
        ft = { "lua" },
        config = function()
          vim.cmd [[autocmd BufWrite *.lua silent call LuaFormat()]]
        end
      }

      use {
        "mhartington/formatter.nvim",
        config = function() require("plug-config.format");
        end
      }

      use { "djoshea/vim-autoread" }
      use { "github/copilot.vim" }
      use { "nvim-lua/popup.nvim" }
      use { "davidgranstrom/nvim-markdown-preview" }
      use { "RRethy/vim-illuminate" }
      use { "mg979/vim-visual-multi", branch = "master" }
      use { "tpope/vim-surround" }
      use { "prettier/vim-prettier", run = "npm install" }
      use { "dstein64/vim-startuptime" }
      use { "styled-components/vim-styled-components", branch = "main" }

      -- Automatically set up your configuration after cloning packer.nvim
      if Packer_bootstrap then
        require('packer').sync()
      end
    end
)
