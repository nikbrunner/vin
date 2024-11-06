local M = {}

---@type LazyPluginSpec
M.spec = {
    "ariel-frischer/bmessages.nvim",
    event = "VeryLazy",
    keys = {
        {
            "<leader>vm",
            "<CMD>Bmessagesvs<CR>",
            desc = "Messages",
        },
    },
    opts = {},
}

return M.spec
