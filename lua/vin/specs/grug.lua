local M = {}

---@type LazyPluginSpec
M.spec = {
    "MagicDuck/grug-far.nvim",
    opts = {},
    keys = {
        -- TODO: It would be better I think if we would introduce a [D]ocument/[F]ile Group and a [W]orkspace Group
        {
            "<leader>cr",
            function()
                require("grug-far").grug_far({ prefills = { paths = vim.fn.expand("%") } })
            end,
            desc = "Search & [R]eplace",
        },
        {
            "<leader>cr",
            mode = "x",
            function()
                require("grug-far").grug_far({ prefills = { paths = vim.fn.expand("%") } })
            end,
            desc = "Search & [R]eplace",
        },
        {
            "<leader>cR",
            function()
                require("grug-far").grug_far()
            end,
            desc = "Search & [R]eplace (Workspace)",
        },
        {
            "<leader>cR",
            mode = "x",
            function()
                require("grug-far").grug_far({ prefills = { search = vim.fn.expand("<cword>") } })
            end,
            desc = "Search & [R]eplace (Workspace)",
        },
    },
}

return M.spec
