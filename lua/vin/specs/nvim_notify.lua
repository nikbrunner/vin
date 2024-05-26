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
        background_colour = "Normal",
        stages = "static",
    },
}

return M.spec
