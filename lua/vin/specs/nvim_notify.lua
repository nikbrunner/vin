local M = {}

---@type LazyPluginSpec
M.spec = {
    "rcarriga/nvim-notify",
    lazy = false,
    enabled = false,
    init = function()
        vim.opt.termguicolors = true
        vim.notify = require("notify")
    end,
    opts = {
        background_colour = "#191919",
    },
}

return M.spec
