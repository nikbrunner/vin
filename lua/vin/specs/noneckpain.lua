local M = {}

---@type LazyPluginSpec
M.spec = {
    "shortcuts/no-neck-pain.nvim",
    event = "VeryLazy",
    keys = {
        {
            "<leader>z",
            function()
                vim.cmd("Neotree close")
                vim.cmd("NoNeckPain")
            end,
            desc = "[Z]en",
        },
    },
    opts = {
        width = 165,
    },
}

return M.spec
