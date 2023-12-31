local M = {}

-- Function to update the winbar
function M.update_winbar()
    -- Ensure nvim-web-devicons is loaded
    local has_devicons, devicons = pcall(require, "nvim-web-devicons")
    if not has_devicons then
        return
    end

    -- Exclusion logic remains the same
    local filetype = vim.bo.filetype
    local excluded_filetypes = {
        ["neo-tree"] = true,
        ["neo-tree-popup"] = true,
        [""] = true,
    }
    if excluded_filetypes[filetype] then
        return
    end

    -- Get the file name and extension
    local filename = vim.api.nvim_buf_get_name(0)
    local relative_filename = vim.fn.fnamemodify(filename, ":~:.")

    -- Get the icon
    local icon = devicons.get_icon_by_filetype(filetype) or ""

    -- Set the winbar text with icon
    vim.wo.winbar = relative_filename .. " " .. icon
end

M.group = vim.api.nvim_create_augroup("vin_winbar", { clear = true })

function M.init_winbar()
    -- Autocommand to update the winbar
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter", "BufRead", "BufWrite" }, {
        pattern = "*",
        group = M.group,
        callback = M.update_winbar,
    })
end

M.init_winbar()
