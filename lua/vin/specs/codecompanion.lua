return {
    "olimorris/codecompanion.nvim",
    event = "VeryLazy",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "nvim-telescope/telescope.nvim", -- Optional
        {
            "stevearc/dressing.nvim", -- Optional: Improves the default Neovim UI
            opts = {},
        },
    },
    -- Source: https://github.com/olimorris/codecompanion.nvim?tab=readme-ov-file#hammer_and_wrench-defaults
    opts = {
        strategies = {
            chat = {
                adapter = "anthropic",
            },
            inline = {
                adapter = "openai",
            },
        },
        opts = {
            saved_chats_dir = vim.fn.stdpath("config") .. "/codecompanion/chats",
        },
    },
    config = true,
}
