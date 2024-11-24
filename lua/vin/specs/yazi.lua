local ui = require("vin.lib.ui")

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
            "<leader>em",
            function()
                require("yazi").yazi()
            end,
            desc = "Manager",
        },
        {
            "<leader>eM",
            function()
                require("yazi").yazi(nil, vim.fn.getcwd())
            end,
            desc = "Manager (CWD)",
        },
    },
    -- TODO: Image Preview does not work: https://github.com/mikavilpas/yazi.nvim/issues/112
    ---@type YaziConfig
    opts = {
        yazi_floating_window_winblend = 0,
        floating_window_scaling_factor = 0.8,
        yazi_floating_window_border = "solid",
        ---@diagnostic disable-next-line: missing-fields
        hooks = {
            ---@diagnostic disable-next-line: unused-local
            yazi_opened = function(preselected_path, buffer, config)
                ui.create_backdrop()
            end,
            ---@diagnostic disable-next-line: unused-local
            yazi_closed_successfully = function(chosen_file, config, state)
                ui.close_backdrop()
            end,
        },
    },
}

return M.spec
