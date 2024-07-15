local M = {}

---@type LazySpec
M.spec = {
    "mikavilpas/yazi.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    event = "VeryLazy",
    keys = {
        {
            "<leader>f",
            function()
                require("yazi").yazi()
            end,
            desc = "[E]xplorer",
        },
        {
            "<leader>F",
            function()
                require("yazi").yazi(nil, vim.fn.getcwd())
            end,
            desc = "[F]iles (from CWD)",
        },
    },
    -- TODO: Image Preview does not work: https://github.com/mikavilpas/yazi.nvim/issues/112
    ---@type YaziConfig
    opts = {
        yazi_floating_window_winblend = 10,
        floating_window_scaling_factor = 0.8,
        yazi_floating_window_border = "solid",
    },
}

return M.spec
