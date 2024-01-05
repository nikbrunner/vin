local create_autocmd = vim.api.nvim_create_autocmd
local config = require("vin.config")

local function augroup(name)
    return vim.api.nvim_create_augroup("vin_" .. name, { clear = true })
end

create_autocmd("UIEnter", {
    group = augroup("ui_enter"),
    callback = function()
        vim.cmd.colorscheme(config.colorscheme)
    end,
})

-- Close these filetypes with <Esc> in normal mode
create_autocmd("FileType", {
    group = augroup("quit_mapping"),
    pattern = {
        "qf",
        "help",
        "man",
        "notify",
        "lspinfo",
        "spectre_panel",
        "startuptime",
        "tsplayground",
        "PlenaryTestPopup",
        "diagmsg",
        "chatpgpt",
        "fzf",
        "aerial-nav",
        "dropbar_menu",
        "bmessages_buffer",
    },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = event.buf, silent = true })
        vim.keymap.set("n", "<ESC>", "<cmd>close<CR>", { buffer = event.buf, silent = true })
    end,
})

-- go to last loc when opening a buffer
create_autocmd("BufReadPost", {
    group = augroup("last_loc"),
    callback = function(event)
        local exclude = { "gitcommit" }
        local buf = event.buf
        if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then
            return
        end
        vim.b[buf].lazyvim_last_loc = true
        local mark = vim.api.nvim_buf_get_mark(buf, '"')
        local lcount = vim.api.nvim_buf_line_count(buf)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

-- On every buff enter and refocus refresh neotree
create_autocmd("BufEnter", {
    group = augroup("neotree_refresh"),
    pattern = { "*" },
    callback = function()
        require("neo-tree.sources.manager").refresh()
    end,
})
