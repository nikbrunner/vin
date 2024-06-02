local M = {}

---@type LazyPluginSpec
M.spec = {
    "black-atom-industries/black-atom.nvim",
    dev = true,
    pin = true,
    lazy = false,
    ---@module "black-atom"
    ---@type BlackAtom.Config
    opts = {
        debug = false,
        theme = require("vin.config").colorscheme,
        styles = {
            dark_sidebars = true,
            transparency = "partial",
            cmp_kind_color_mode = "bg",
            diagnostics = {
                background = true,
            },
        },
    },
}

return M.spec
