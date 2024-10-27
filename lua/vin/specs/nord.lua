---@type LazyPluginSpec
return {
    "gbprod/nord.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        on_highlights = function(highlights, colors)
            local darken = require("vin.lib.colors").darken
            local dark_bg = darken(colors.polar_night.origin, 0.8)

            highlights.NeoTreeNormal = { bg = dark_bg }
            highlights.NeoTreeNormalNC = { bg = dark_bg }
            highlights.NormalFloat = { bg = dark_bg }
            highlights.FloatBorder = { bg = dark_bg }
            highlights.FloatTitle = { bg = dark_bg }
            highlights.EndOfBuffer = { fg = colors.polar_night.origin }
            highlights.FzfLuaNormal = { link = "NeoTreeNormal" }
            highlights.FzfLuaBorder = { link = "FzfLuaNormal" }
        end,
    },
}
