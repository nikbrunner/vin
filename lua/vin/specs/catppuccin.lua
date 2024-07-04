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
