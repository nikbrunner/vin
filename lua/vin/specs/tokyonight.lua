---@diagnostic disable: inject-field
local M = {}

---@type LazyPluginSpec
M.spec = {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    ---@module "tokyonight"
    ---@type tokyonight.Config
    opts = {
        on_highlights = function(highlights, colors)
            highlights.YaziFloat = { link = "NormalFloat" }
        end,
    },
}

return M.spec
