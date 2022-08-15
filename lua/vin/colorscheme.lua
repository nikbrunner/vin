Vin.colorscheme = {
    theme = "terra",
    -- theme = "github_dark_default",
    -- theme = "github_dimmed",
}

local present, _ = pcall(vim.cmd, "colorscheme " .. Vin.colorscheme.theme)
if not present then
    vim.notify("colorscheme " .. Vin.colorscheme.theme .. " not found!")

    vim.cmd([[
    colorscheme default
    set background=dark
  ]] )
    return
else
    vim.cmd("colorscheme " .. Vin.colorscheme.theme)
end
