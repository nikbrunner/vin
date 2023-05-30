local notify = require("vin.lib.ui").notify

local create_autocmd = vim.api.nvim_create_autocmd

-- Highlight on yank
create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- resize splits if window got resized
create_autocmd({ "VimResized" }, {
    callback = function()
        vim.cmd("tabdo wincmd =")
    end,
})

-- go to last loc when opening a buffer
create_autocmd("BufReadPost", {
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = { "tsconfig.json", ".eslintrc.json" },
    callback = function()
        vim.bo.filetype = "jsonc"
    end,
})

create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "*.ejs",
    callback = function()
        vim.bo.filetype = "ejs"
    end,
})

-- close some filetypes with <q>
create_autocmd("FileType", {
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
        "ObsidianBacklinks",
    },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.keymap.set(
            "n",
            "q",
            "<cmd>close<cr>",
            { buffer = event.buf, silent = true }
        )
    end,
})

-- Set wrapping and spell for gitcommit and markdown filetypes
create_autocmd("FileType", {
    pattern = { "gitcommit", "markdown" },
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.spell = true
    end,
})

-- Check for file changes on certain events
create_autocmd({
    "FocusGained",
    "BufEnter",
    "CursorHold",
    "CursorHoldI",
    "TermClose",
    "TermLeave",
}, {
    pattern = "*",
    callback = function(ev)
        if vim.api.nvim_get_mode().mode ~= "c" then
            vim.cmd.checktime()
        end
    end,
})

-- Notify when file changed on disk
create_autocmd("FileChangedShellPost", {
    pattern = "*",
    callback = function()
        notify("File changed on disk. Buffer reloaded.", vim.log.levels.INFO, {
            title = "File Changed",
        })
    end,
})
