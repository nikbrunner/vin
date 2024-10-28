local M = {}

---@type LazyPluginSpec
M.spec = {
    "gbprod/yanky.nvim",
    dependencies = {
        { "kkharji/sqlite.lua" },
    },
    opts = {},
    keys = {
        { "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" } },
        { "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" } },

        {
            "<C-p>",
            function()
                require("telescope").extensions.yank_history.yank_history({})
            end,
            desc = "[Y]ank History",
            mode = { "i", "n", "x" },
        },
    },
}

return M.spec
