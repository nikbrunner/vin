local M = {}
---@type LazyPluginSpec
M.spec = {
    "gbprod/yanky.nvim",
    dependencies = { "chrisgrieser/cmp_yanky" },
    opts = {},
    keys = {
        { "<c-p>", "<Plug>(YankyPreviousEntry)" },
        { "<c-n>", "<Plug>(YankyNextEntry)" },

        { "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" } },
        { "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" } },

        {
            "<C-r>",
            "<cmd>Telescope yank_history theme=ivy<cr>",
            desc = "[Y]ank History",
            mode = { "i", "n", "x" },
        },
    },
}

return M.spec
