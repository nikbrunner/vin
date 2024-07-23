local M = {}

---@type LazyPluginSpec
M.spec = {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    ---@module "catppuccin"
    ---@type CatppuccinOptions
    opts = {
        term_colors = true,
        color_overrides = {
            all = {
                mantle = "#0e1313",
                base = "#121818",
                crust = "#1c2424",
                -- mauve = "#9dafa6",
                -- blue = "#8fa7bc",
            },
        },
        custom_highlights = function(colors)
            return {
                YaziFloat = { link = "NormalFloat" },
                FzfLuaNormal = { link = "NormalFloat" },
                FzfLuaBorder = { link = "FloatBorder" },
                FzfLuaPreviewBorder = { link = "FloatBorder" },
                TreesitterContextBottom = { sp = colors.surface0, style = false },
            }
        end,
    },
}

return M.spec
