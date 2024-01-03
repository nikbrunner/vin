---@diagnostic disable: assign-type-mismatch, missing-fields
local M = {}

---@type LazySpec
M.spec = {
    "numToStr/Navigator.nvim",
    keys = {
        {
            "<C-h>",
            "<CMD>NavigatorLeft<CR>",
            mode = { "n", "t" },
        },
        {
            "<C-l>",
            "<CMD>NavigatorRight<CR>",
            mode = { "n", "t" },
        },
        {
            "<C-k>",
            "<CMD>NavigatorUp<CR>",
            mode = { "n", "t" },
        },
        {
            "<C-j>",
            "<CMD>NavigatorDown<CR>",
            mode = { "n", "t" },
        },
    },
    config = function(_, opts)
        require("Navigator").setup(opts)
    end,
}

return M.spec
