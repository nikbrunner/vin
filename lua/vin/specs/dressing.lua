local M = {}

---@type LazyPluginSpec
M.spec = {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    ---@type dressing.InputOptions
    opts = {
        input = {
            insert_only = false,
            mappings = {
                n = {
                    ["<Esc>"] = "Close",
                    ["q"] = "Close",
                    ["<CR>"] = "Confirm",
                },
                i = {
                    ["<C-c>"] = "Close",
                    ["<CR>"] = "Confirm",
                    ["<Up>"] = "HistoryPrev",
                    ["<Down>"] = "HistoryNext",
                },
            },
        },
    },
}

return M.spec
