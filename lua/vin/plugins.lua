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
    max_jobs = 15, -- Limit the number of simultaneous jobs. nil means no limit
    auto_clean = true, -- During sync(), remove unused plugins
    compile_on_sync = true, -- During sync(), run packer.compile()
})

-- Install your plugins here
return packer.startup(function(use) -- My plugins here
    use({
        -- INFO: Have packer manage itself
        "wbthomason/packer.nvim",
    })

    use({
        -- INFO: An implementation of the Popup API from vim in Neovim
        -- TODO: Check if needed
        "nvim-lua/popup.nvim",
    })

    use({
        -- INFO: Useful lua functions used ny lots of plugins
        "nvim-lua/plenary.nvim",
    })

    use({
        -- INFO: Cache Modules
        "lewis6991/impatient.nvim",
    })

    use({
        -- INFO: Configs for native LSP
        "neovim/nvim-lspconfig",
    })

    use({
        -- INFO: VSCode Like Pictograms for LSP Iitems
        -- TODO: Own RC File
        "onsails/lspkind-nvim",
        commmit = "57e5b5dfbe991151b07d272a06e365a77cc3d0e7",
    })

    use({
        "williamboman/mason.nvim",
    })

    use({
        "williamboman/mason-lspconfig.nvim",
    })

    use({
        -- INFO: language server settings defined in json
        "tamago324/nlsp-settings.nvim",
    })

    use({
        -- INFO: for formatters and linters
        "jose-elias-alvarez/null-ls.nvim",
    })

    use({
        -- INFO: for parameter hints
        "ray-x/lsp_signature.nvim",
    })

    use({
        -- INFO: Tool Package for LSP
        "glepnir/lspsaga.nvim",
        branch = "main",
    })

    use({
        -- INFO: Lua Development
        -- TODO: Check if needed
        "folke/lua-dev.nvim",
    })

    use({
        -- INFO: Style up basic neovim components
        "stevearc/dressing.nvim",
    })

    use({
        -- INFO: Pretty Icons
        "kyazdani42/nvim-web-devicons",
    })

    use({
        "kyazdani42/nvim-tree.lua",
        requires = {
            "kyazdani42/nvim-web-devicons", -- optional, for file icons
        },
    })

    use({
        -- INFO: Status Line
        "nvim-lualine/lualine.nvim",
    })

    use({
        -- INFO: Starting screen
        "goolord/alpha-nvim",
    })

    use({
        -- INFO: Organizied Mappings
        "folke/which-key.nvim",
    })

    use({
        -- INFO: The completion engine
        "hrsh7th/nvim-cmp",
    })

    use({
        -- INFO: Completion for LSP items
        "hrsh7th/cmp-nvim-lsp",
    })

    use({
        -- INFO: Completions for words in Buffer
        "hrsh7th/cmp-buffer",
    })

    use({
        -- INFO: Completions for Path
        "hrsh7th/cmp-path",
    })

    use({
        -- INFO: snippet completions
        "saadparwaiz1/cmp_luasnip",
    })

    use({
        -- INFO: Snippet Engine. This is indirectly needed for CMP
        "L3MON4D3/LuaSnip",
    })

    use({
        -- INFO: a bunch of snippets to use
        -- INFO: See snippets for react here: https://github.com/rafamadriz/friendly-snippets/blob/main/snippets/javascript/react-ts.json
        "rafamadriz/friendly-snippets",
    })

    -- INFO: Colorschemes
    use({
        -- INFO: My Theme :)
        "~/Documents/dev/repos/personal/terra-theme/nvim",
        -- 	"terra-theme/nvim",
    })

    use({
        -- INFO: GitHub Theme
        "projekt0n/github-nvim-theme",
    })

    use({
        -- INFO: Flexible fuzzy finder
        "nvim-telescope/telescope.nvim",
    })

    use({
        -- INFO: Extension to search through GitHub related files
        -- TODO: Fix my own implementation
        "nvim-telescope/telescope-github.nvim",
    })

    use({
        "nvim-telescope/telescope-project.nvim",
    })

    -- INFO: Treesitter
    use({
        -- INFO: Abstract Syntax Tree (AST), which helps with Syntax Highliting, Code and Code Analysation
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    })

    use({
        -- INFO: Treesitter Playground to show the current AST
        "nvim-treesitter/playground",
        run = ":TSInstall query",
    })

    use({
        -- INFO: Bar at the top which, shows the current scope
        "nvim-treesitter/nvim-treesitter-context",
    })

    use({
        -- INFO: Better comments which helps in templates files like React etc
        "JoosepAlviste/nvim-ts-context-commentstring",
    })

    use({
        -- INFO: Various tools around Git
        "lewis6991/gitsigns.nvim",
    })

    use({

        "sindrets/diffview.nvim",
        requires = "nvim-lua/plenary.nvim",
    })

    use({
        -- INFO: Autopairs for Brackets, integrates with both cmp and treesitter
        "windwp/nvim-autopairs",
    })

    use({
        -- INFO: Automatically closes tags
        "windwp/nvim-ts-autotag",
    })

    use({
        -- INFO: Easily comment stuff
        "numToStr/Comment.nvim",
    })

    use({
        -- INFO: Tools for closing buffers
        "kazhala/close-buffers.nvim",
    })

    use({
        -- INFO: Focus a window with a shortcut
        "s1n7ax/nvim-window-picker",
        tag = "v1.*",
    })

    use({
        -- INFO: Highlight all occurences of current word under cursor
        -- TODO: Check if needed
        "RRethy/vim-illuminate",
    })

    use({
        -- INFO: Code Navigation. Enables cib for example
        -- TODO: Research deeper
        "wellle/targets.vim",
    })

    use({
        -- INFO: Hotkey files
        "ThePrimeagen/harpoon",
    })

    use({
        -- INFO: Improvements for the QF List
        "kevinhwang91/nvim-bqf",
        ft = "qf",
    })

    use({
        -- INFO: Prettier Notifications for nvim
        "rcarriga/nvim-notify",
    })

    use({
        -- INFO: Zen Mode
        "folke/zen-mode.nvim",
    })

    use({
        -- INFO: Display all todos in a pretty way
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
    })

    use({
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
    })

    use({
        -- INFO: Automatically sets the indent by analysing the first 100 lines of the file
        "nmac427/guess-indent.nvim",
    })

    use({
        -- INFO: Lazygit for Neovim :)
        "kdheepak/lazygit.nvim",
    })

    use({
        -- INFO: Prettier folds
        "anuvyklack/pretty-fold.nvim",
        requires = {
            "anuvyklack/fold-preview.nvim",
            "anuvyklack/keymap-amend.nvim",
        },
    })

    use({
        -- INFO: Preview Markdown Files
        "davidgranstrom/nvim-markdown-preview",
    })

    use({
        "uga-rosa/ccc.nvim",
    })

    use({
        "kylechui/nvim-surround",
        tag = "*",
    })

    use({
        "AckslD/nvim-neoclip.lua",
    })

    use({
        "SmiteshP/nvim-navic",
        requires = "neovim/nvim-lspconfig",
    })

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        packer.sync()
    end
end)
