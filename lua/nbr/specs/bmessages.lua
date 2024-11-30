local M = {}

---@type LazyPluginSpec
M.spec = {
    "ariel-frischer/bmessages.nvim",
    lazy = false,
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
