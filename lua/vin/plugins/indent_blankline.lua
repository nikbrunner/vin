---@type LazySpec
local spec = {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPost",
    enabled = true,
    opts = function()
        local Dot = Vin.icons.ui.SmallDot
        local LineMiddle = Vin.icons.ui.LineMiddle

        local char = Vin.config.dot_mode and Dot or LineMiddle

        return {
            char = char,
            filetype_exclude = {
                "help",
                "alpha",
                "dashboard",
                "neo-tree",
                "Trouble",
                "lazy",
            },
            show_trailing_blankline_indent = false,
            show_current_context = false,
        }
    end,
}

return spec
