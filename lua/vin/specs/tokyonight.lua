local M = {}

---@type LazyPluginSpec
M.spec = {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    ---@module "tokyonight"
    ---@type tokyonight.Config
    opts = {},
}

return M.spec
