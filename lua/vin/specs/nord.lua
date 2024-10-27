---@type LazyPluginSpec
return {
    "gbprod/nord.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        on_highlights = function(highlights, colors)
            local dark_bg = "#232731"

            highlights.NeoTreeNormal = { bg = dark_bg }
            highlights.NeoTreeNormalNC = { bg = dark_bg }
            highlights.FloatBorder = { bg = dark_bg }
            highlights.FzfLuaNormal = { link = "NeoTreeNormal" }
        end,
    },
}
