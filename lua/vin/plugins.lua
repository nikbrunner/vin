local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print(
		"Hi, my name is Vin! Please take a seat, I'm installing packer for you and get you set up!"
	)
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use) -- My plugins here
	use("wbthomason/packer.nvim") -- Have packer manage itself

	-- Libs for Utility and general Improvements
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
	use("lewis6991/impatient.nvim")

	-- UI Enhancements
	use("kyazdani42/nvim-web-devicons")
	-- use("kyazdani42/nvim-tree.lua")
	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v1.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
	})
	use("akinsho/bufferline.nvim")
	use({ "windwp/windline.nvim" })
	use("goolord/alpha-nvim")
	use("folke/which-key.nvim")

	-- Workflow
	use("antoinemadec/FixCursorHold.nvim") -- This is needed to fix lsp doc highlight
	use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter
	use("numToStr/Comment.nvim") -- Easily comment stuff
	use("lukas-reineke/indent-blankline.nvim") -- Indent Outline
	use({ "numToStr/BufOnly.nvim", cmd = "BufOnly" })
	use("moll/vim-bbye")
	use({ "RRethy/vim-illuminate" })
	use({ "tpope/vim-surround" })
	use({ "wellle/targets.vim" })
	use({ "mg979/vim-visual-multi", branch = "master" })
	use("djoshea/vim-autoread")
	use("ThePrimeagen/harpoon")
	use("gennaro-tedesco/nvim-jqx")
	use({ "weilbith/nvim-code-action-menu", cmd = "CodeActionMenu" })
	use({ "github/copilot.vim" })
	use({
		"AckslD/nvim-neoclip.lua",
		requires = {
			{ "nvim-telescope/telescope.nvim" },
		},
	})
	use({ "kevinhwang91/nvim-bqf", ft = "qf" })
	use({ "simrat39/symbols-outline.nvim" })
	use({ "rcarriga/nvim-notify" })

	-- Colorschemes
	use("lunarvim/colorschemes")
	use("projekt0n/github-nvim-theme")
	use({
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	})

	-- cmp plugins
	use({ "hrsh7th/nvim-cmp" }) -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp")

	-- snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- LSP
	use("neovim/nvim-lspconfig") -- enable LSP
	use("williamboman/nvim-lsp-installer") -- simple to use language server installer
	use("tamago324/nlsp-settings.nvim") -- language server settings defined in json for
	use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
	use("ray-x/lsp_signature.nvim") --for parameter hints
	use({ "j-hui/fidget.nvim" }) -- for LSP progress
	use("folke/lua-dev.nvim")
	use({ "onsails/lspkind-nvim" })
	use({ "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons" })
	use({ "stevearc/dressing.nvim" })

	-- Fuzzy finding
	use("nvim-telescope/telescope.nvim")
	use("ahmedkhalf/project.nvim")
	use({ "nvim-telescope/telescope-github.nvim" })
	use({ "junegunn/fzf", run = "./install --bin" })
	use({ "ibhagwan/fzf-lua" })

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("JoosepAlviste/nvim-ts-context-commentstring")

	-- Git
	use("lewis6991/gitsigns.nvim")
	use("kdheepak/lazygit.nvim")
	use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })
	use({ "pwntester/octo.nvim" })

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
