local terra_present, terra = pcall(require, "terra")
if terra_present then
    terra.setup({
        season = "winter",
    })
end

---@diagnostic disable-next-line: unused-function
local transparentBackground = function()
    -- Standard
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "WinSeparator", { link = "NonText" })
    vim.api.nvim_set_hl(0, "VertSplit", { link = "NonText" })

    -- NeoTree
    vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "none" })
    vim.api.nvim_set_hl(0, "NeoTreeEndOfBuffer", { bg = "none" })

    -- NvimTree
    vim.api.nvim_set_hl(0, "NvimTreeNormalNC", { bg = "none" })
    vim.api.nvim_set_hl(0, "NvimTreeVertSplit", { link = "NonText" })
    vim.api.nvim_set_hl(0, "NvimTreeWinSeparator", { link = "NonText" })
end

function InitColorScheme(color)
    color = color or "default"
    vim.cmd.colorscheme(color)
end

InitColorScheme(Vin.config.colorscheme)
