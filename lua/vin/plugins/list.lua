return {
    -- Colorschemes --------------------------------------------
    {
        -- "terra-theme/nvim",
        dir = "~/Documents/dev/repos/personal/terra-theme/nvim",
        lazy = false,
        priority = 1000,
        -- dev = true,
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
    },

    -- LSP Support ---------------------------------------------
    { "VonHeikemen/lsp-zero.nvim" },
    { "neovim/nvim-lspconfig" },
    { "williamboman/mason.nvim" },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = "williamboman/mason.nvim",
    },

    -- LSP Extensions ------------------------------------------
    { "onsails/lspkind-nvim" },
    { "tamago324/nlsp-settings.nvim" },
    { "jose-elias-alvarez/null-ls.nvim" },
    { "folke/neodev.nvim" },

    -- Autocompletion ------------------------------------------
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "saadparwaiz1/cmp_luasnip" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lua" },
        },
    },

    -- AI & Copilot --------------------------------------------
    {
        "zbirenbaum/copilot.lua",
        event = "InsertEnter",
    },
    {
        "zbirenbaum/copilot-cmp",
        dependencies = { "zbirenbaum/copilot.lua" },
    },

    -- Snippets ------------------------------------------------
    {
        "L3MON4D3/LuaSnip",
        dependencies = { "rafamadriz/friendly-snippets" },
        event = "VeryLazy",
    },

    -- UI Enhancements -----------------------------------------
    {
        "folke/noice.nvim",
        lazy = false,
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
    },
    {
        "davidgranstrom/nvim-markdown-preview",
        lazy = false,
    },
    {
        "kyazdani42/nvim-tree.lua",
        dependencies = "kyazdani42/nvim-web-devicons",
    },
    {
        "nvim-lualine/lualine.nvim",
    },
    {
        "stevearc/dressing.nvim",
        event = "VeryLazy",
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
    },
    {
        "anuvyklack/pretty-fold.nvim",
        event = "VeryLazy",
        dependencies = {
            "anuvyklack/fold-preview.nvim",
            "anuvyklack/keymap-amend.nvim",
        },
    },

    -- Git -----------------------------------------------------
    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
    },
    {
        "sindrets/diffview.nvim",
        event = "VeryLazy",
        dependencies = "nvim-lua/plenary.nvim",
    },
    {
        "kdheepak/lazygit.nvim",
        event = "VeryLazy",
    },

    -- Fuzzy Find ----------------------------------------------
    {
        "nvim-telescope/telescope.nvim",
        event = "VeryLazy",
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        dependencies = "nvim-telescope/telescope.nvim",
        event = "VeryLazy",
    },
    {
        "nvim-telescope/telescope-github.nvim",
        dependencies = "nvim-telescope/telescope.nvim",
        event = "VeryLazy",
    },
    {
        "nvim-telescope/telescope-project.nvim",
        dependencies = "nvim-telescope/telescope.nvim",
        event = "VeryLazy",
    },

    -- Treesitter ----------------------------------------------
    {
        "nvim-treesitter/nvim-treesitter",
        build = function()
            pcall(require("nvim-treesitter.install").update({ with_sync = true }))
        end,
    },
    {
        "nvim-treesitter/playground",
        dependencies = "nvim-treesitter/nvim-treesitter",
        event = "VeryLazy",
        build = function()
            local present, _ = pcall(vim.cmd, "TSInstall")
            if present then
                vim.cmd("TSInstall query")
            end
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        dependencies = "nvim-treesitter/nvim-treesitter",
        event = "VeryLazy",
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = "nvim-treesitter/nvim-treesitter",
        event = "VeryLazy",
    },
    {
        "JoosepAlviste/nvim-ts-context-commentstring",
        dependencies = "nvim-treesitter/nvim-treesitter",
        event = "VeryLazy",
    },
    {
        "windwp/nvim-autopairs",
        dependencies = "nvim-treesitter/nvim-treesitter",
        event = "VeryLazy",
    },
    {
        "windwp/nvim-ts-autotag",
        dependencies = "nvim-treesitter/nvim-treesitter",
        event = "VeryLazy",
    },

    -- Utilities -----------------------------------------------
    { "nvim-lua/popup.nvim" },
    { "nvim-lua/plenary.nvim" },
    { "uga-rosa/ccc.nvim", event = "VeryLazy" }, -- TODO: Replace

    -- Editing & Workflow --------------------------------------
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
    },
    {
        "ThePrimeagen/harpoon",
        event = "VeryLazy",
    },
    {
        "numToStr/Comment.nvim",
        event = "VeryLazy",
    },
    {
        "kazhala/close-buffers.nvim",
        event = "VeryLazy",
    },
    {
        "s1n7ax/nvim-window-picker",
        event = "VeryLazy",
        version = "v1.*",
    },
    { -- TODO: Replace with lua version
        "RRethy/vim-illuminate",
        event = "VeryLazy",
    },
    {
        "wellle/targets.vim",
        event = "VeryLazy",
    },
    {
        "folke/zen-mode.nvim",
        event = "VeryLazy",
    },
    {
        "chentoast/marks.nvim",
        event = "VeryLazy",
    },
    {
        "folke/todo-comments.nvim",
        event = "VeryLazy",
        dependencies = "nvim-lua/plenary.nvim",
    },
    {
        "folke/trouble.nvim",
        dependencies = "kyazdani42/nvim-web-devicons",
        event = "VeryLazy",
    },
    -- { "nmac427/guess-indent.nvim" }, -- TODO: Do I need this really?
    {
        "anuvyklack/windows.nvim",
        event = "VeryLazy",
        dependencies = {
            "anuvyklack/middleclass",
            "anuvyklack/animation.nvim",
        },
    },
}
