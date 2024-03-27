local M = {}

---@type LazyPluginSpec
M.spec = {
    "black-atom-industries/black-atom-core.nvim",
    dependencies = {
        { "black-atom-industries/black-atom-terra-collection.nvim", dev = true },
    },
    dev = true,
    lazy = false,
    priority = 1000,
    ---@type BlackAtomCore.Config
    opts = {
        debug = false,
        theme = require("vin.config").colorscheme,
        styles = {
            dark_sidebars = require("vin.config").custom_highlights.enable_contrast,
            transparency = "none",
            cmp_kind_color_mode = "bg",
            diagnostics = {
                background = true,
            },
        },
    },
}

return M.spec
