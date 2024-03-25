local M = {}

-- TODO: add binding to add a new todo comment
-- TODO: prefill with parsed issue number?

---@type LazyPluginSpec
M.spec = {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "BufReadPre",
    keys = {
        { "<leader>st", "<cmd>TodoTelescope<CR>", desc = "Todos" },
        {
            "]t",
            function()
                require("todo-comments").jump_next()
            end,
            desc = "Next todo comment",
        },
        {
            "[t",
            function()
                require("todo-comments").jump_prev()
            end,
            desc = "Prev todo comment",
        },
    },
    opts = {},
}

return M.spec
