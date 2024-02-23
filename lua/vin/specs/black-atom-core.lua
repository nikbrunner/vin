local M = {}

---@type LazyPluginSpec
M.spec = {
    "black-atom-industries/black-atom-core.nvim",
    dev = true,
    lazy = false,
    priority = 1000,
    keys = {
        {
            "<leader>bt",
            function()
                require("black-atom-core.util").select_theme()
            end,
            desc = "Select theme",
        },
        {
            "<leader>bv",
            function()
                require("black-atom-core.util").select_variant()
            end,
            desc = "Select variant",
        },
    },
    ---@type BlackAtomCore.Config
    opts = {
        debug = false,
        theme = "winter",
        variant = "night",
        styles = {
            dark_sidebars = true,
            transparency = "none",
            cmp_kind_color_mode = "bg",
            diagnostics = {
                background = true,
            },
        },
    },
}

return M.spec
