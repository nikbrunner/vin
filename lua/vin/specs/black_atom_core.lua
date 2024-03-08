local M = {}

---@type LazyPluginSpec
M.spec = {
    "black-atom-industries/black-atom-core.nvim",
    dev = true,
    lazy = false,
    priority = 1000,
    keys = {
        {
            "<leader>uT",
            function()
                require("black-atom-core.util").select_theme()
            end,
            desc = "Theme Selector (Black Atom) ",
        },
    },
    ---@type BlackAtomCore.Config
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
