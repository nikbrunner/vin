return {
    { "nvim-lua/popup.nvim" },

    -- INFO: Useful lua functions used ny lots of plugins
    { "nvim-lua/plenary.nvim" },

    -- INFO: Configs for native LSP
    { "neovim/nvim-lspconfig" },

    -- INFO: VSCode Like Pictograms for LSP Iitems
    { "onsails/lspkind-nvim" },

    -- INFO: LSP Installation GUI and Helper
    { "williamboman/mason.nvim" },

    -- INFO: Bridge for Mason to nvim-lspconfig
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = "williamboman/mason.nvim",
    },

    -- INFO: Language Server Settings defined in json (e.g. tsconfig)
    { "tamago324/nlsp-settings.nvim" },

    -- INFO: For formatters and linters
    { "jose-elias-alvarez/null-ls.nvim" },

    -- INFO: for parameter hints
    { "ray-x/lsp_signature.nvim" },

    -- INFO: Lua Development
    { "folke/neodev.nvim" },

    -- INFO: Style up basic neovim components
    { "stevearc/dressing.nvim", event = "VeryLazy" },

    -- INFO: Pretty Icons
    { "kyazdani42/nvim-web-devicons" },

    -- INFO: File Tree
    {
        "kyazdani42/nvim-tree.lua",
        dependencies = "kyazdani42/nvim-web-devicons", -- optional, for file icons
    },

    -- INFO: Statusline, Tabline, Winbar
    { "nvim-lualine/lualine.nvim" },

    -- INFO: Organizied Mappings
    { "folke/which-key.nvim" },

    -- INFO: Snippet Engine. This is indirectly needed for CMP
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            {
                -- A bunch of snippets to use (https://github.com/rafamadriz/friendly-snippets/blob/main/snippets/javascript/react-ts.json)
                "rafamadriz/friendly-snippets",
            },
        },
    },

    -- INFO: The completion engine
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
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
    },

    -- INFO: Flexible fuzzy finder
    { "nvim-telescope/telescope.nvim" },

    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
    },

    -- INFO: Extension to search through GitHub related files
    {
        "nvim-telescope/telescope-github.nvim",
        dependencies = "nvim-telescope/telescope.nvim",
    },

    {
        "nvim-telescope/telescope-project.nvim",
        dependencies = "nvim-telescope/telescope.nvim",
    },

    -- INFO: Abstract Syntax Tree (AST), which helps with Syntax Highliting, Code and Code Analysation
    {
        -- Highlight, edit, and navigate code
        "nvim-treesitter/nvim-treesitter",
        build = function()
            pcall(require("nvim-treesitter.install").update({ with_sync = true }))
        end,
    },

    -- INFO: Treesitter Playground to show the current AST
    {
        "nvim-treesitter/playground",
        dependencies = "nvim-treesitter/nvim-treesitter",
        build = function()
            local present, _ = pcall(vim.cmd, "TSInstall")
            if present then
                vim.cmd("TSInstall query")
            end
        end,
    },

    -- INFO: Bar at the top which, shows the current scope
    {
        "nvim-treesitter/nvim-treesitter-context",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
    },

    { -- Additional text objects via treesitter
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
    },

    -- INFO: Better comments which helps in templates files like React etc
    {
        "JoosepAlviste/nvim-ts-context-commentstring",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
    },

    -- INFO: Autopairs for Brackets, integrates with both cmp and treesitter
    {
        "windwp/nvim-autopairs",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
    },

    {
        -- INFO: Automatically closes tags
        "windwp/nvim-ts-autotag",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
    },

    -- INFO: Various tools around Git
    { "lewis6991/gitsigns.nvim" },

    -- INFO: Git Tool to help with checking diffs
    { "sindrets/diffview.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

    -- INFO: Easily comment stuff
    { "numToStr/Comment.nvim" },

    -- INFO: Tools for closing buffers
    { "kazhala/close-buffers.nvim" },

    -- INFO: Focus a window with a shortcut
    { "s1n7ax/nvim-window-picker", version = "v1.*" },

    -- INFO: Highlight all occurences of current word under cursor
    -- TODO: Replace with lua version
    { "RRethy/vim-illuminate" },

    -- INFO: Code Navigation. Enables cib for example
    -- TODO: Research deeper
    { "wellle/targets.vim" },

    -- INFO: Hotkey files
    { "ThePrimeagen/harpoon" },

    -- INFO: Zen Mode
    { "folke/zen-mode.nvim" },

    { "chentoast/marks.nvim" },

    -- INFO: Display all todos in a pretty way
    { "folke/todo-comments.nvim", dependencies = "nvim-lua/plenary.nvim" },

    -- INFO: LSP Problems View
    { "folke/trouble.nvim", dependencies = "kyazdani42/nvim-web-devicons" },

    -- INFO: Automatically sets the indent by analysing the first 100 lines of the file
    { "nmac427/guess-indent.nvim" },

    -- INFO: Lazygit inside Neovim :)
    { "kdheepak/lazygit.nvim" },

    -- INFO: Prettier folds
    {
        "anuvyklack/pretty-fold.nvim",
        dependencies = {
            {
                "anuvyklack/fold-preview.nvim",
            },
            {
                "anuvyklack/keymap-amend.nvim",
            },
        },
    },

    -- INFO: Window Maximizer
    {
        "anuvyklack/windows.nvim",
        dependencies = {
            "anuvyklack/middleclass",
            "anuvyklack/animation.nvim",
        },
    },

    -- INFO: Preview and edit colors
    { "uga-rosa/ccc.nvim" },

    -- INFO: Surround text actions
    { "kylechui/nvim-surround", version = "*" },

    -- INFO: Colorschemes
    { "folke/tokyonight.nvim" },
    { "terra-theme/nvim" },
    -- { "~/Documents/dev/repos/personal/terra-theme/nvim" },
}
