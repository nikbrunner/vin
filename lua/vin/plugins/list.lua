return {
    { "nvim-lua/popup.nvim" },
    { "nvim-lua/plenary.nvim" },
    { "neovim/nvim-lspconfig" },
    { "onsails/lspkind-nvim" },
    {
        "j-hui/fidget.nvim",
    },
    { "williamboman/mason.nvim" },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = "williamboman/mason.nvim",
    },
    { "tamago324/nlsp-settings.nvim" },
    { "jose-elias-alvarez/null-ls.nvim" },
    { "ray-x/lsp_signature.nvim" },
    { "folke/neodev.nvim" },
    { "stevearc/dressing.nvim", event = "VeryLazy" },
    { "kyazdani42/nvim-web-devicons" },
    {
        "kyazdani42/nvim-tree.lua",
        dependencies = "kyazdani42/nvim-web-devicons", -- optional, for file icons
    },
    { "nvim-lualine/lualine.nvim" },
    { "folke/which-key.nvim" },
    {
        "L3MON4D3/LuaSnip",
        dependencies = { "rafamadriz/friendly-snippets" },
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "saadparwaiz1/cmp_luasnip",
        },
    },
    { "nvim-telescope/telescope.nvim", event = "VeryLazy" },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        dependencies = "nvim-telescope/telescope.nvim",
    },
    {
        "nvim-telescope/telescope-github.nvim",
        dependencies = "nvim-telescope/telescope.nvim",
    },
    {
        "nvim-telescope/telescope-project.nvim",
        dependencies = "nvim-telescope/telescope.nvim",
    },
    {
        -- Highlight, edit, and navigate code
        "nvim-treesitter/nvim-treesitter",
        build = function()
            pcall(require("nvim-treesitter.install").update({ with_sync = true }))
        end,
    },
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
    {
        "nvim-treesitter/nvim-treesitter-context",
        dependencies = "nvim-treesitter/nvim-treesitter",
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = "nvim-treesitter/nvim-treesitter",
    },
    {
        "JoosepAlviste/nvim-ts-context-commentstring",
        dependencies = "nvim-treesitter/nvim-treesitter",
    },
    {
        "windwp/nvim-autopairs",
        dependencies = "nvim-treesitter/nvim-treesitter",
    },
    {
        "windwp/nvim-ts-autotag",
        dependencies = "nvim-treesitter/nvim-treesitter",
    },
    { "lewis6991/gitsigns.nvim" },
    { "sindrets/diffview.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
    { "numToStr/Comment.nvim" },
    { "kazhala/close-buffers.nvim" },
    { "s1n7ax/nvim-window-picker", version = "v1.*" },
    { "RRethy/vim-illuminate" }, -- TODO: Replace with lua version
    { "wellle/targets.vim" },
    { "ThePrimeagen/harpoon" },
    { "folke/zen-mode.nvim" },
    { "chentoast/marks.nvim" },
    { "folke/todo-comments.nvim", dependencies = "nvim-lua/plenary.nvim" },
    { "folke/trouble.nvim", dependencies = "kyazdani42/nvim-web-devicons" },
    { "nmac427/guess-indent.nvim" },
    { "kdheepak/lazygit.nvim" },
    {
        "anuvyklack/pretty-fold.nvim",
        dependencies = {
            "anuvyklack/fold-preview.nvim",
            "anuvyklack/keymap-amend.nvim",
        },
    },
    {
        "anuvyklack/windows.nvim",
        dependencies = {
            "anuvyklack/middleclass",
            "anuvyklack/animation.nvim",
        },
    },
    { "uga-rosa/ccc.nvim" }, -- TODO: Replace
    { "kylechui/nvim-surround", version = "*" },
    { "folke/tokyonight.nvim" },
    { "terra-theme/nvim" }, -- TODO: Use dev mode
    -- { "~/Documents/dev/repos/personal/terra-theme/nvim" },
}
