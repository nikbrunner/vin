-- Adjustments to the default colorscheme
local set = vim.api.nvim_set_hl

local comment_hl = vim.api.nvim_get_hl(0, {
    name = "Comment",
})

set(0, "WinSeparator", { fg = comment_hl.fg })
set(0, "VertSplit", { link = "WinSeparator" })
set(0, "FloatBorder", { link = "WinSeparator" })
