local create_autocmd = vim.api.nvim_create_autocmd
local config = require("vin.config")

local function augroup(name)
    return vim.api.nvim_create_augroup("vin_" .. name, { clear = true })
end

create_autocmd("UIEnter", {
    group = augroup("ui_enter"),
    callback = function()
        vim.cmd.colorscheme(config.colorscheme)

        local filetype = vim.bo.filetype
        local excluded_filetypes = { "gitcommit" }

        if not vim.tbl_contains(excluded_filetypes, filetype) then
            require("fzf-lua").oldfiles({ cwd_only = true })
        end
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
        "ftterm_lazygit",
        "ftterm_gh_dash",
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

-- Check if we need to reload the file when it changed
create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
    group = augroup("checktime"),
    command = "checktime",
})

-- Highlight on yank
create_autocmd("TextYankPost", {
    group = augroup("highlight_yank"),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- resize splits if window got resized
create_autocmd({ "VimResized" }, {
    group = augroup("resize_splits"),
    callback = function()
        local current_tab = vim.fn.tabpagenr()
        vim.cmd("tabdo wincmd =")
        vim.cmd("tabnext " .. current_tab)
    end,
})
