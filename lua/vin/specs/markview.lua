local M = {}

---@type LazyPluginSpec
M.spec = {
    "OXY2DEV/markview.nvim",
    ft = "markdown",
    keys = {
        {
            "<leader>um",
            ":Markview toggle<CR>",
            desc = "Toggle Markiew",
        },
    },
}

return M.spec
