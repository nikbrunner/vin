local M = {}

---@type LazyPluginSpec
M.spec = {
    "ruifm/gitlinker.nvim",
    event = "BufEnter",
    requires = "nvim-lua/plenary.nvim",
    opts = {
        -- FIX: This doesn't disable the mapping.
        -- See here: https://github.com/ruifm/gitlinker.nvim/blob/master/lua/gitlinker/mappings.lua
        mappings = nil,
    },
}

return M.spec
