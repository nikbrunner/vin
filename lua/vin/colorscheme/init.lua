local notify_status_ok, notify = pcall(require, "notify")
if not notify_status_ok then
    return
end

Vin.colorscheme = {
    initial_theme = "terra",
    -- initial_theme = "github_dark_default",
}

require("vin.colorscheme.terra")
-- require("vin.colorscheme.github")

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. Vin.colorscheme.initial_theme)
if not status_ok then
    notify("colorscheme " .. Vin.colorscheme.initial_theme .. " not found!")

    vim.cmd([[
    colorscheme default
    set background=dark
  ]])
    return
else
    vim.cmd("colorscheme " .. Vin.colorscheme.initial_theme)
end
