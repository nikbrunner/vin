local M = {}

---Finds a pattern in a line of a file and replaces it with a value
---@param filepath string
---@param pattern string
---@param value string
function M.update_line_in_file(filepath, pattern, value)
    local lines = vim.fn.readfile(filepath)
    lines = vim.tbl_map(function(line)
        if vim.fn.match(line, pattern) ~= -1 then
            line = vim.fn.substitute(line, '".*"', value, "")
        end
        return line
    end, lines)

    vim.fn.writefile(lines, filepath)
end

---Syncs the wezterm colorscheme with the current nvim colorscheme (if configured)
---@param config VinConfig
---@param colorscheme string
function M.sync_wezterm_colorscheme(config, colorscheme)
    local pathes = config.pathes

    local colorscheme_config = config.colorscheme_config_map[colorscheme]

    if colorscheme_config and colorscheme_config.wezterm then
        M.update_line_in_file(pathes.config.wezterm, "color_scheme", '"' .. colorscheme_config.wezterm .. '"')
    end
end

---@param config VinConfig
---@param colorscheme string
---@param background string
function M.sync_vin_colorscheme(config, colorscheme, background)
    M.update_line_in_file(config.pathes.config.vin, "colorscheme", '"' .. colorscheme .. '"')
    M.update_line_in_file(config.pathes.config.vin, "background", '"' .. background .. '"')
end

return M
