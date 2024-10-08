local M = {}

---@type LazyPluginSpec
M.spec = {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
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
        select = {
            enabled = false,
            -- Priority list of preferred vim.select implementations
            backend = { "telescope", "fzf_lua" },
            fzf_lua = {
                winopts = {
                    row = 0.85,
                    col = 0.5,
                    height = 0.25,
                    width = 0.5,
                },
            },
        },
    },
}

return M.spec
