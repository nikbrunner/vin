local M = {}

---@type LazyPluginSpec
M.spec = {
    "black-atom-industries/black-atom-core.nvim",
    dev = true,
    lazy = false,
    priority = 1000,
    keys = {
        {
            "<leader>vtt",
            function()
                require("terra-core.lib.config").select_theme()
            end,
            desc = "Select theme",
        },
        {
            "<leader>vtv",
            function()
                require("terra-core.lib.config").select_variant()
            end,
            desc = "Select variant",
        },
    },
    ---@type TerraConfig
    opts = {
        debug = false,
        theme = "winter",
        variant = "night",
        styles = {
            dark_sidebars = true,
            transparency = "partial",
            cmp_kind_color_mode = "bg",
            diagnostics = {
                background = true,
            },
        },
    },
    config = function(_, opts)
        require("terra-core").setup(opts)
    end,
}

return M.spec
