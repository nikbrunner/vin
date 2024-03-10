local M = {}

---@type LazyPluginSpec
M.spec = {
    "ariel-frischer/bmessages.nvim",
    event = "VeryLazy",
    keys = {
        {
            "<leader>vm",
            "<CMD>Bmessagessp<CR>",
            desc = "[M]essages",
        },
        {
            "<leader>vM",
            "<CMD>Bmessagesvs<CR>",
            desc = "[M]essages (VS)",
        },
    },
    opts = {},
}

return M.spec
