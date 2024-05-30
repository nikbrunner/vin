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

M._maximized_window = nil
function M.maximize_window()
    if M._maximized_window then
        vim.o.winwidth = M._maximized_window.width
        vim.o.winheight = M._maximized_window.height
        M._maximized_window = nil
        vim.cmd("wincmd =")
    else
        M._maximized_window = {
            width = vim.o.winwidth,
            height = vim.o.winheight,
        }
        vim.o.winwidth = 999
        vim.o.winheight = 999
    end
end

return M
