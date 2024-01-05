local M = {}

M.float_win_opts = function(width, height, row, col)
    return {
        relative = "editor",
        width = width,
        height = height,
        row = row,
        col = col,
        style = "minimal",
        border = "single",
    }
end

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

        vim.opt_local.spell = false
        vim.opt_local.wrap = false
        vim.opt_local.signcolumn = "yes"
        vim.opt_local.statuscolumn = " "
        vim.opt_local.conceallevel = 3

        -- Define the window size and position
        local width, height = vim.o.columns, vim.o.lines
        local win_width, win_height = math.ceil(width * 0.8), math.ceil(height * 0.8)
        local row, col = math.ceil((height - win_height) / 2 - 1), math.ceil((width - win_width) / 2)

        -- Open the floating window
        local win = vim.api.nvim_open_win(bufnr, true, M.float_win_opts(win_width, win_height, row, col))

        -- set the conceallevel to 1 to hide the markdown syntax
        vim.wo[win].conceallevel = 1

        -- Custom command for saving with overwrite
        vim.keymap.set("n", "<C-s>", "<Cmd>wq!<CR>", { buffer = bufnr, noremap = true, silent = true })
        vim.keymap.set("n", "<Esc>", "<Cmd>wq!<CR>", { buffer = bufnr, noremap = true, silent = true })
    end
end

---Opens a terminal in a floating window with the given command
---@param command string
function M.open_float_term(command)
    -- Define the size and position of the floating window
    local width = math.ceil(vim.o.columns * 0.8)
    local height = math.ceil(vim.o.lines * 0.8)
    local row = math.ceil((vim.o.lines - height) / 2 - 1)
    local col = math.ceil((vim.o.columns - width) / 2)

    -- Create a buffer for the terminal
    local bufnr = vim.api.nvim_create_buf(false, true)

    -- Create a floating window
    local win = vim.api.nvim_open_win(bufnr, true, M.float_win_opts(width, height, row, col))

    -- Run the command in the terminal
    vim.fn.termopen(command, { detach = true })

    -- Start terminal in insert mode
    vim.cmd.startinsert()

    -- Custom command for saving with overwrite
    vim.keymap.set("t", "<C-q>", "<Cmd>wq!<CR>", { buffer = bufnr, noremap = true, silent = true })

    -- Set the terminal buffer to the created buffer
    vim.api.nvim_set_current_buf(bufnr)
end

return M
