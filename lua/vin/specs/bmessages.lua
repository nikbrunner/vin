local M = {}

---@type LazyPluginSpec
M.spec = {
    "ariel-frischer/bmessages.nvim",
    event = "VeryLazy",
    keys = {
        {
            "<leader>vm",
            "<CMD>Bmessagessp<CR>",
            desc = "Show messages (Split)",
        },
        {
            "<leader>vM",
            "<CMD>Bmessagesvs<CR>",
            desc = "Show messages (Vertical)",
        },
    },
    opts = {},
}

return M.spec
