local M = {}

---@type LazyPluginSpec
M.spec = {
    "MagicDuck/grug-far.nvim",
    opts = {},
    keys = {
        {
            "<leader>f",
            mode = { "n", "x" },
            function()
                require("grug-far").grug_far()
            end,
            desc = "Find",
        },
        {
            "<leader>F",
            mode = "x",
            function()
                require("grug-far").grug_far({ prefills = { paths = vim.fn.expand("%") } })
            end,
            desc = "Search & [R]eplace (Workspace)",
        },
    },
}

return M.spec
