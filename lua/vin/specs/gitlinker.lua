local M = {}

---@type LazyPluginSpec
M.spec = {
    "ruifm/gitlinker.nvim",
    event = "BufEnter",
    requires = "nvim-lua/plenary.nvim",
    opts = {},
}

return M.spec
