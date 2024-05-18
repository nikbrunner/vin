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

    local colorscheme_config = config.colors_config_map[colorscheme]

    -- If the colorscheme has custom highlights disabled, then don't set them
    local enable_custom_highlights = colorscheme_config.enable_custom_highlights or false
    if colorscheme_config and enable_custom_highlights then
        require("vin.lib.highlights").set_custom_highlights()
        vim.notify_once("Setting custom highlights for colorscheme: " .. colorscheme, vim.log.levels.INFO, { title = "Vin" })
    end
end

return M
