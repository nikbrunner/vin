local M = {}

---@type LazyPluginSpec
M.spec = {
    "black-atom-industries/nvim",
    name = "black-atom",
    dir = require("vin.config").pathes.repos .. "/black-atom-industries/nvim",
    lazy = false,
    priority = 1000,
    ---@module "black-atom"
    ---@type BlackAtom.Config
    opts = {
        theme = require("vin.config").colorscheme,
        styles = {
            transparency = "none",
            cmp_kind_color_mode = "bg",
            diagnostics = {
                background = true,
            },
        },
    },
}

return M.spec
