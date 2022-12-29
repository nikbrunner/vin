local terra_present, terra = pcall(require, "terra")
if terra_present then
    terra.setup({
        season = "summer",
    })
end

---@diagnostic disable-next-line: unused-function
local transparentBackground = function()
    -- Enable these to make the backgrounds transparent
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

function PaintMe(color)
    color = color or "default"
    vim.cmd.colorscheme(color)
end

PaintMe(Vin.config.colorscheme)
