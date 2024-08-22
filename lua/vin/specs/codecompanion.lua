local M = {}

---@type LazyPluginSpec
M.spec = {
    "olimorris/codecompanion.nvim",
    event = "VeryLazy",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        { "stevearc/dressing.nvim", opts = {} },
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
        keymaps = {
            send = {
                modes = {
                    n = "<C-s>",
                    i = "<C-s>",
                },
                index = 1,
                callback = "keymaps.send",
                description = "Send",
            },
        },
        opts = {
            silence_notifications = true,
            saved_chats_dir = vim.fn.stdpath("config") .. "/codecompanion/chats",
        },
    },
    keys = {
        { "<leader>ic", "<cmd>CodeCompanionChat<CR>", desc = "AI Chat" },
        { "<leader>ia", "<cmd>CodeCompanionActions<CR>", desc = "AI Actions" },
    },
}

return M.spec
