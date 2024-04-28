local M = {}

---@type LazyPluginSpec
M.spec = {
    "black-atom-industries/black-atom-core.nvim",
    dev = true,
    pin = true,
    lazy = false,
    ---@type BlackAtomCore.Config
    opts = {
        debug = false,
        theme = require("vin.config").colorscheme,
        styles = {
            dark_sidebars = require("vin.config").custom_highlights.enable_contrast,
            transparency = "partial",
            cmp_kind_color_mode = "bg",
            diagnostics = {
                background = true,
            },
        },
    },
}

return M.spec
