local M = {}

---@param config VinConfig
---@param colorscheme string
---@param background string
function M.handle_colors(config, colorscheme, background)
    vim.opt.background = background
    vim.cmd.colorscheme(colorscheme)
    vim.notify_once("Setting colorscheme: " .. colorscheme, vim.log.levels.INFO, { title = "Vin" })

    require("vin.lib.files").sync_vin_colorscheme(config, colorscheme, background)
    require("vin.lib.files").sync_wezterm_colorscheme(config, colorscheme)
end

return M
