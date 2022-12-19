-- Automatically install packer
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

---@diagnostic disable-next-line: missing-parameter
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = vim.fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })

    vim.cmd([[packadd packer.nvim]])
end

-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
--
-- You'll need to restart nvim, and then it will work.
if PACKER_BOOTSTRAP then
    print("==================================")
    print("    Hi there, my name is vin!")
    print("    Please take a seat.")
    print("    I'll get everything set up.")
    print("    Plugins are being installed")
    print("    Wait until Packer completes,")
    print("       then restart nvim")
    print("==================================")
end

-- Use a protected call so we don't error out on first use
local packer_ok, packer = pcall(require, "packer")
if not packer_ok then
    return
end

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup("Packer", { clear = true })

vim.api.nvim_create_autocmd("BufWritePost", {
    command = "source <afile> | PackerCompile",
    group = packer_group,
    ---@diagnostic disable-next-line: missing-parameter
    pattern = vim.fn.expand("$MYVIMRC"),
})

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
    ensure_dependencies = true, -- Should packer install plugin dependencies?
})

-- Init impatient to increase performenace
pcall(require, "impatient")

packer.startup(function(use)
    -- INFO: Have the package-manager manage itself
    use({ "wbthomason/packer.nvim" })

    -- INFO: An implementation of the Popup API from vim in Neovim
    use({ "nvim-lua/popup.nvim" })

    -- INFO: Useful lua functions used ny lots of plugins
    use({ "nvim-lua/plenary.nvim" })

    -- INFO: Cache Modules for faster startups
    use({ "lewis6991/impatient.nvim" })

    -- INFO: Configs for native LSP
    use({ "neovim/nvim-lspconfig" })

    -- INFO: VSCode Like Pictograms for LSP Iitems
    use({ "onsails/lspkind-nvim" })

    -- INFO: LSP Installation GUI and Helper
    use({ "williamboman/mason.nvim" })

    -- INFO: Bridge for Mason to nvim-lspconfig
    use({
        "williamboman/mason-lspconfig.nvim",
        requires = "williamboman/mason.nvim",
    })

    -- INFO: Language Server Settings defined in json (e.g. tsconfig)
    use({ "tamago324/nlsp-settings.nvim" })

    -- INFO: For formatters and linters
    use({ "jose-elias-alvarez/null-ls.nvim" })

    -- INFO: for parameter hints
    use({ "ray-x/lsp_signature.nvim" })

    -- INFO: Tool Package for LSP
    use({ "glepnir/lspsaga.nvim", branch = "main" })

    -- INFO: Lua Development
    use({ "folke/neodev.nvim" })

    -- INFO: Style up basic neovim components
    use({ "stevearc/dressing.nvim" })

    -- INFO: Pretty Icons
    use({ "kyazdani42/nvim-web-devicons" })

    -- INFO: File Tree
    use({
        "kyazdani42/nvim-tree.lua",
        requires = "kyazdani42/nvim-web-devicons", -- optional, for file icons
    })

    -- INFO: Statusline, Tabline, Winbar
    use({ "nvim-lualine/lualine.nvim" })

    -- INFO: Organizied Mappings
    use({ "folke/which-key.nvim" })

    -- INFO: Snippet Engine. This is indirectly needed for CMP
    use({
        "L3MON4D3/LuaSnip",
        requires = {
            {
                -- A bunch of snippets to use (https://github.com/rafamadriz/friendly-snippets/blob/main/snippets/javascript/react-ts.json)
                "rafamadriz/friendly-snippets",
            },
        },
    })

    -- INFO: The completion engine
    use({
        "hrsh7th/nvim-cmp",
        requires = {
            {
                -- Completion for LSP items
                "hrsh7th/cmp-nvim-lsp",
            },
            {
                -- Completions for words in Buffer
                "hrsh7th/cmp-buffer",
            },

            {
                -- Completions for Path
                "hrsh7th/cmp-path",
            },
            {
                -- Snippet completions
                "saadparwaiz1/cmp_luasnip",
            },
        },
    })

    -- INFO: Flexible fuzzy finder
    use({ "nvim-telescope/telescope.nvim" })

    use({
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "make",
        cond = vim.fn.executable("make") == 1,
    })

    -- INFO: Extension to search through GitHub related files
    use({
        "nvim-telescope/telescope-github.nvim",
        requires = "nvim-telescope/telescope.nvim",
    })

    use({
        "nvim-telescope/telescope-project.nvim",
        requires = "nvim-telescope/telescope.nvim",
    })

    -- INFO: Abstract Syntax Tree (AST), which helps with Syntax Highliting, Code and Code Analysation
    use({
        -- Highlight, edit, and navigate code
        "nvim-treesitter/nvim-treesitter",
        run = function()
            pcall(require("nvim-treesitter.install").update({ with_sync = true }))
        end,
    })

    -- INFO: Treesitter Playground to show the current AST
    use({
        "nvim-treesitter/playground",
        requires = "nvim-treesitter/nvim-treesitter",
        after = "nvim-treesitter",
        run = function()
            local present, _ = pcall(vim.cmd, "TSInstall")
            if present then
                vim.cmd("TSInstall query")
            end
        end,
    })

    -- INFO: Bar at the top which, shows the current scope
    use({
        "nvim-treesitter/nvim-treesitter-context",
        requires = "nvim-treesitter/nvim-treesitter",
        after = "nvim-treesitter",
    })

    use({ -- Additional text objects via treesitter
        "nvim-treesitter/nvim-treesitter-textobjects",
        after = "nvim-treesitter",
    })

    -- INFO: Better comments which helps in templates files like React etc
    use({
        "JoosepAlviste/nvim-ts-context-commentstring",
        requires = "nvim-treesitter/nvim-treesitter",
        after = "nvim-treesitter",
    })

    -- INFO: Autopairs for Brackets, integrates with both cmp and treesitter
    use({
        "windwp/nvim-autopairs",
        requires = "nvim-treesitter/nvim-treesitter",
        after = "nvim-treesitter",
    })

    use({
        -- INFO: Automatically closes tags
        "windwp/nvim-ts-autotag",
        requires = "nvim-treesitter/nvim-treesitter",
        after = "nvim-treesitter",
    })

    -- INFO: Various tools around Git
    use({ "lewis6991/gitsigns.nvim" })

    -- INFO: Git Tool to help with checking diffs
    use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })

    -- INFO: Easily comment stuff
    use({ "numToStr/Comment.nvim" })

    -- INFO: Tools for closing buffers
    use({ "kazhala/close-buffers.nvim" })

    -- INFO: Focus a window with a shortcut
    use({ "s1n7ax/nvim-window-picker", tag = "v1.*" })

    -- INFO: Highlight all occurences of current word under cursor
    -- TODO: Replace with lua version
    use({ "RRethy/vim-illuminate" })

    -- INFO: Code Navigation. Enables cib for example
    -- TODO: Research deeper
    use({ "wellle/targets.vim" })

    -- INFO: Hotkey files
    use({ "ThePrimeagen/harpoon" })

    -- INFO: Improvements for the QF List
    use({ "kevinhwang91/nvim-bqf", ft = "qf", disable = true })

    -- INFO: Zen Mode
    use({ "folke/zen-mode.nvim" })

    -- INFO: Display all todos in a pretty way
    use({ "folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim" })

    -- INFO: LSP Problems View
    use({ "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons" })

    -- INFO: Automatically sets the indent by analysing the first 100 lines of the file
    use({ "nmac427/guess-indent.nvim" })

    -- INFO: Lazygit inside Neovim :)
    use({ "kdheepak/lazygit.nvim" })

    -- INFO: Prettier folds
    use({
        "anuvyklack/pretty-fold.nvim",
        requires = {
            {
                "anuvyklack/fold-preview.nvim",
            },
            {
                "anuvyklack/keymap-amend.nvim",
            },
        },
    })

    -- INFO: Window Maximizer
    use({
        "anuvyklack/windows.nvim",
        requires = {
            "anuvyklack/middleclass",
            "anuvyklack/animation.nvim",
        },
    })

    -- INFO: Preview and edit colors
    use({ "uga-rosa/ccc.nvim" })

    -- INFO: Surround text actions
    use({ "kylechui/nvim-surround", tag = "*" })

    -- INFO: Colorschemes
    use({ "folke/tokyonight.nvim" })
    -- use({ "terra-theme/nvim" })
    use({ "~/Documents/dev/repos/personal/terra-theme/nvim" })

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        packer.sync()
    end
end)
