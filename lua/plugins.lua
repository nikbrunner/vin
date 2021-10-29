local packer = require("packer")
local auto = require("auto")

local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

-- Bootstraping Packer if not already installed
-- https://github.com/wbthomason/packer.nvim#bootstrapping
if fn.empty(fn.glob(install_path)) > 0 then
  execute(
      "!git clone https://github.com/wbthomason/packer.nvim " .. install_path
  )
  execute "packadd packer.nvim"
end

-- Auto source when there are changes in plugins.lua
auto.BufWritePost = { "plugins.lua", "source <afile> | PackerCompile" }

local use = packer.use

packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end
  }
}

packer.startup(
    function()
      use { "wbthomason/packer.nvim", opt = false }

      use { "neovim/nvim-lspconfig" }

      use {
        "williamboman/nvim-lsp-installer",
        config = function()
          require("plugins.lsp-installer")
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
          require("plugins.completion");
        end
      }

      use {
        "folke/lua-dev.nvim",
        config = function()
          require("plugins.lua-dev")
        end
      }

      -- NOTE fork replacement for lspsaga
      use {
        "rinx/lspsaga.nvim",
        config = function()
          require("plugins.lspsaga")
        end
      }

      use {
        "onsails/lspkind-nvim",
        config = function()
          require("plugins.kind")
        end
      }

      use {
        "folke/lsp-trouble.nvim",
        config = function()
          require("plugins.trouble")
        end
      }

      use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = function()
          require("plugins.treesitter")
        end
      }

      use {
        "kyazdani42/nvim-tree.lua",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
          require("plugins.nvimtree")
        end
      }

      use {
        "lewis6991/gitsigns.nvim",
        config = function()
          require("plugins.gitsigns")
        end
      }

      use {
        "kevinhwang91/nvim-bqf",
        config = function()
          require("plugins.nvim-bqf")
        end
      }

      use {
        "ThePrimeagen/harpoon",
        requires = { "nvim-lua/plenary.nvim" }
      }

      use {
        "kdheepak/lazygit.nvim",
        config = function()
          require("plugins.lazygit")
        end
      }


      use {
        "projekt0n/github-nvim-theme",
        config = function()
          require("plugins.github-nvim")
        end
      }

      -- use {
      --   "folke/tokyonight.nvim",
      --   config = function()
      --     require("plugins.tokyonight")
      --   end
      -- }
      --
      use {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
          require("plugins.indent-blankline")
        end
      }

      use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
          require("plugins.todo")
        end
      }

      use {
        "nvim-telescope/telescope.nvim",
        requires = { { "nvim-lua/plenary.nvim" } },
        config = function()
          require("plugins.telescope");
        end
      }

      use {
        "nvim-telescope/telescope-fzy-native.nvim",
        requires = { "nvim-telescope/telescope.nvim" },
        run = "git submodule update --init --recursive"
      }

      use {
        "folke/which-key.nvim",
        config = function()
          require("plugins.whichkey");
        end
      }

      use {
        "ahmedkhalf/project.nvim",
        config = function()
          require("plugins.projects");
        end
      }

      use {
        "numToStr/Comment.nvim",
        config = function()
          require("Comment").setup()
        end
      }

      use {
        "windwp/nvim-autopairs",
        config = function()
          require("nvim-autopairs").setup {}
        end
      }

      use {
        "karb94/neoscroll.nvim",
        config = function()
          require("plugins.neoscroll")
        end
      }

      use {
        "folke/zen-mode.nvim",
        config = function()
          require("plugins.zen-mode");
        end
      }

      use {
        "machakann/vim-highlightedyank",
        config = function()
          require("plugins.highlightedyank");
        end
      }

      use {
        "norcalli/nvim-colorizer.lua",
        config = function()
          require("plugins.colorizer")
        end
      }

      use {
        "glepnir/dashboard-nvim",
        config = function()
          require("plugins.dashboard");
        end
      }

      use {
        "glepnir/galaxyline.nvim",
        branch = "main",
        config = function()
          require("plugins.statusline");
        end
      }

      use {
        "romgrk/barbar.nvim",
        requires = { "kyazdani42/nvim-web-devicons" },
        config = function()
          require("plugins.barbar")
        end
      }

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
          require("plugins.format");
        end
      }

      use { "djoshea/vim-autoread" }
      use { "nvim-lua/popup.nvim" }
      use { "davidgranstrom/nvim-markdown-preview" }
      use { "RRethy/vim-illuminate" }
      use { "mg979/vim-visual-multi", branch = "master" }
      use { "tpope/vim-surround" }
      use { "prettier/vim-prettier", run = "npm install" }
    end
)
