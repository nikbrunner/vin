local M = {}

---@type LazyPluginSpec
M.spec = {
    "ariel-frischer/bmessages.nvim",
    lazy = false,
    keys = {
        {
            "<leader>am",
            "<CMD>Bmessagesvs<CR>",
            desc = "Show messages",
        },
    },
    opts = {},
}

return M.spec
