---@type LazyPluginSpec
return {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    ---@module "catppuccin"
    ---@type CatppuccinOptions
    opts = {
        term_colors = true,
        -- color_overrides = {
        --     all = {
        --         mantle = "#182121",
        --         base = "#1c2626",
        --         crust = "#273232",
        --         mauve = "#9dafa6",
        --         blue = "#8fa7bc",
        --     },
        -- },
        custom_highlights = function(colors)
            return {
                FloatBorder = { bg = colors.mantle },
                FloatTitle = { bg = colors.mantle },
                FzfLuaNormal = { bg = colors.mantle },
                FzfLuaBorder = { bg = colors.mantle },
                YaziFloat = { bg = colors.mantle },
                TreesitterContextBottom = { sp = colors.surface0, style = false },
            }
        end,
    },
}
