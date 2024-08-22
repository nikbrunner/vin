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
            auto_save_chats = true,
            saved_chats_dir = vim.fn.stdpath("config") .. "/codecompanion/chats",
        },
    },
    keys = {
        { "<leader>ia", "<cmd>CodeCompanionActions<CR>", desc = "AI Actions" },
        { "<leader>it", "<cmd>CodeCompanionToggle<CR>", desc = "AI Actions" },
        { "ga", "<cmd>CodeCompanionAdd<CR>", desc = "Add Selection", mode = { "v" } },
    },
    init = function()
        vim.cmd([[cab cc CodeCompanion]])
    end,
}

return M.spec
