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

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
-- This is also the place for any other packer settings
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
	git = {
		subcommands = { -- Format strings for git subcommands
			update = "pull --ff-only --progress --rebase=true",
		},
	},
	-- NOTE: Limiting the max jobs helps when packer gets stuck on "checking current commit"
	max_jobs = 10, -- Limit the number of simultaneous jobs. nil means no limit
	auto_clean = true, -- During sync(), remove unused plugins
	compile_on_sync = true, -- During sync(), run packer.compile()
})

-- Install your plugins here
return packer.startup(function(use) -- My plugins here
	use({ "wbthomason/packer.nvim" }) -- Have packer manage itself

	-- Libs for Utility and general Improvements
	use({ "nvim-lua/popup.nvim" }) -- An implementation of the Popup API from vim in Neovim
	use({ "nvim-lua/plenary.nvim" }) -- Useful lua functions used ny lots of plugins
	use({ "lewis6991/impatient.nvim" })

	-- UI Enhancements
	use({ "kyazdani42/nvim-web-devicons" })
	use({ "kyazdani42/nvim-tree.lua" })
	use({ "stevearc/aerial.nvim" })
	use({ "nvim-lualine/lualine.nvim" })
	use({ "goolord/alpha-nvim" })
	use({ "folke/which-key.nvim" })
	use({ "stevearc/dressing.nvim" })
	use({
		"cseickel/diagnostic-window.nvim",
		requires = { "MunifTanjim/nui.nvim" },
	})

	-- Workflow
	use({ "antoinemadec/FixCursorHold.nvim" }) -- This is needed to fix lsp doc highlight
	use({ "windwp/nvim-autopairs" }) -- Autopairs, integrates with both cmp and treesitter
	use({ "numToStr/Comment.nvim" }) -- Easily comment stuff
	use({ "lukas-reineke/indent-blankline.nvim", disable = true }) -- Indent Outline
	use({ "kazhala/close-buffers.nvim" })
	use({ "s1n7ax/nvim-window-picker", tag = "v1.*" })
	use({ "RRethy/vim-illuminate" })
	use({ "tpope/vim-surround" })
	use({ "wellle/targets.vim" })
	use({ "mg979/vim-visual-multi", branch = "master" })
	use({ "djoshea/vim-autoread" })
	use({ "ThePrimeagen/harpoon" })
	use({ "gennaro-tedesco/nvim-jqx" })
	use({ "weilbith/nvim-code-action-menu", cmd = "CodeActionMenu" })
	use({ "kevinhwang91/nvim-bqf", ft = "qf" })
	use({ "rcarriga/nvim-notify" })
	use({ "folke/zen-mode.nvim" })
	use({ "folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim" })
	use({ "David-Kunz/jester" })
	use({ "nmac427/guess-indent.nvim" })
	use({ "SmiteshP/nvim-gps", requires = "nvim-treesitter/nvim-treesitter" })
	use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
	use({ "chentoast/marks.nvim" })
	use({ "windwp/nvim-ts-autotag" })
	use({ "akinsho/toggleterm.nvim", branch = "main" })
	use({ "kdheepak/lazygit.nvim" })
	use({
		"anuvyklack/pretty-fold.nvim",
		requires = {
			"anuvyklack/fold-preview.nvim",
			"anuvyklack/keymap-amend.nvim",
		},
	})
	-- Colorschemes
	use({ "terra-theme/nvim" })
	-- use({ "~/Documents/dev/repos/personal/terra-theme/nvim" })
	use({ "rmehri01/onenord.nvim" })
	use({ "projekt0n/github-nvim-theme" })
	use({ "norcalli/nvim-colorizer.lua" })

	-- cmp plugins
	use({ "hrsh7th/nvim-cmp" }) -- The completion plugin
	use({ "hrsh7th/cmp-buffer" }) -- buffer completions
	use({ "hrsh7th/cmp-path" }) -- path completions
	use({ "hrsh7th/cmp-cmdline" }) -- cmdline completions
	use({ "saadparwaiz1/cmp_luasnip" }) -- snippet completions
	use({ "hrsh7th/cmp-nvim-lsp" })

	-- snippets
	use({ "L3MON4D3/LuaSnip" }) --snippet engine
	use({ "rafamadriz/friendly-snippets" }) -- a bunch of snippets to use

	-- LSP
	use({ "neovim/nvim-lspconfig" }) -- enable LSP
	use({ "williamboman/nvim-lsp-installer" }) -- simple to use language server installer
	use({ "tamago324/nlsp-settings.nvim" }) -- language server settings defined in json for
	use({ "jose-elias-alvarez/null-ls.nvim" }) -- for formatters and linters
	use({ "ray-x/lsp_signature.nvim" }) --for parameter hints
	use({ "j-hui/fidget.nvim" }) -- for LSP progress
	use({ "folke/lua-dev.nvim" })
	use({ "rafcamlet/nvim-luapad" })
	use({ "onsails/lspkind-nvim" })
	use({ "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons" })
	use({ "Maan2003/lsp_lines.nvim" })

	-- Fuzzy finding
	use({ "nvim-telescope/telescope.nvim" })
	use({ "nvim-telescope/telescope-github.nvim" })
	use({ "ahmedkhalf/project.nvim" })

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use({ "nvim-treesitter/playground", run = ":TSInstall query" })
	use({ "nvim-treesitter/nvim-treesitter-context" })
	use({ "JoosepAlviste/nvim-ts-context-commentstring" })

	-- Git
	use({ "lewis6991/gitsigns.nvim" })
	use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })
	use({ "pwntester/octo.nvim", disable = true })

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		packer.sync()
	end
end)
