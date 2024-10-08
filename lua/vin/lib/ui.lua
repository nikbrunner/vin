local M = {}

---@param config VinConfig
---@param colorscheme string
---@param background string
function M.handle_colors(config, colorscheme, background)
    vim.opt.background = background
    vim.cmd.colorscheme(colorscheme)

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

M.backdrop_buf = nil
M.backdrop_win = nil

function M.create_backdrop()
    M.backdrop_buf = vim.api.nvim_create_buf(false, true)
    M.backdrop_win = vim.api.nvim_open_win(M.backdrop_buf, false, {
        relative = "editor",
        width = vim.o.columns,
        height = vim.o.lines,
        row = 0,
        col = 0,
        style = "minimal",
        focusable = false,
        zindex = 1,
    })

    local set_backdrop_win_opt = function(k, v)
        vim.api.nvim_set_option_value(k, v, {
            scope = "local",
            win = M.backdrop_win,
        })
    end

    vim.api.nvim_set_hl(0, "LazyBackdrop", { bg = "#000000", default = true })
    set_backdrop_win_opt("winhighlight", "Normal:LazyBackdrop")
    set_backdrop_win_opt("winblend", 60)
    vim.bo[M.backdrop_buf].buftype = "nofile"
    vim.bo[M.backdrop_buf].filetype = "lazy_backdrop"
end

function M.close_backdrop()
    if M.backdrop_win then
        vim.api.nvim_win_close(M.backdrop_win, true)
        M.backdrop_win = nil
    end
end

return M
