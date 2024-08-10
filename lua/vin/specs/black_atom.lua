local M = {}

---@type LazyPluginSpec
M.spec = {
    "black-atom-industries/black-atom.nvim",
    dir = require("vin.config").pathes.repos .. "/black-atom-industries/black-atom.nvim",
    pin = true,
    lazy = false,
    dependencies = {
        "black-atom-industries/black-atom-vault",
        dir = require("vin.config").pathes.repos .. "/black-atom-industries/black-atom-vault",
        pin = true,
        lazy = false,
    },
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
