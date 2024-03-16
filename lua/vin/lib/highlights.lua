local M = {}

function M.set_custom_highlights()
    local config = require("vin.config")
    local lib = require("vin.lib")

    if not config.custom_highlights.enable then
        return
    end

    local set_hl = vim.api.nvim_set_hl

    local hl_normal = lib.colors.get_hex_color("Normal")
    local hl_comment = lib.colors.get_hex_color("Comment")
    local darkend_normal_bg = lib.colors.darken(hl_normal.bg, config.custom_highlights.contrast_factor, "#000000")
    local pmenu_bg = config.custom_highlights.enable_contrast and darkend_normal_bg or hl_normal.bg

    set_hl(0, "Pmenu", { fg = hl_normal.fg, bg = pmenu_bg }) -- Since many colorschemes derive their floating and darker elements from it, I manually override it.
    set_hl(0, "EndOfBuffer", { fg = hl_normal.bg }) -- Hide the ~ at the end of the buffer
    set_hl(0, "VertSplit", { fg = hl_comment.fg, bg = hl_normal.bg }) -- WinSeparator derives from this
    set_hl(0, "NormalFloat", { link = "Pmenu" })
    set_hl(0, "FloatBorder", { link = "Pmenu" })
    set_hl(0, "NeoTreeNormal", { link = "Pmenu" })
    set_hl(0, "FzfLuaNormal", { link = "Pmenu" })
    set_hl(0, "Comment", { fg = hl_comment.fg, italic = true })
end

return M
