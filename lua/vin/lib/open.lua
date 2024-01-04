local M = {}

---Opens a file in a floating window
---@param filepath string
function M.open_file_in_floating_window(filepath)
    local bufnr = vim.fn.bufnr(filepath, true)

    if bufnr ~= -1 then
        if vim.fn.bufloaded(bufnr) == 0 then
            vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, vim.fn.readfile(filepath))
        end

        local buffer_options = vim.bo[bufnr]
        buffer_options.buftype = ""
        buffer_options.swapfile = false
        buffer_options.bufhidden = "hide"

        -- Define the window size and position
        local width, height = vim.o.columns, vim.o.lines
        local win_width, win_height = math.ceil(width * 0.8), math.ceil(height * 0.8)
        local row, col = math.ceil((height - win_height) / 2 - 1), math.ceil((width - win_width) / 2)

        -- Open the floating window
        local win = vim.api.nvim_open_win(bufnr, true, {
            relative = "editor",
            width = win_width,
            height = win_height,
            row = row,
            col = col,
            style = "minimal",
            border = "single",
        })

        -- set the conceallevel to 1 to hide the markdown syntax
        vim.wo[win].conceallevel = 1

        -- Custom command for saving with overwrite
        vim.keymap.set("n", "<C-s>", "<Cmd>wq!<CR>", { buffer = bufnr, noremap = true, silent = true })
        vim.keymap.set("n", "<Esc>", "<Cmd>wq!<CR>", { buffer = bufnr, noremap = true, silent = true })
    end
end

return M
