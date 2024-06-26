local M = {}

---@type LazyPluginSpec
M.spec = {
    "gbprod/yanky.nvim",
    opts = {},
    keys = {
        { "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" } },
        { "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" } },

        {
            "<C-r>",
            "<cmd>YankyRingHistory<cr>",
            desc = "[Y]ank History",
            mode = { "i", "n", "x" },
        },
    },
}

return M.spec
