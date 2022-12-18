local colorscheme = "terra"

local terra_present, terra = pcall(require, "terra")
if not terra_present then
    return
else
    terra.setup({
        season = "summer",
    })
end

function ColorMyPencils(color)
    color = color or colorscheme
    vim.cmd.colorscheme(color)

    -- Enable these to make the backgrounds transparent
    -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils()
