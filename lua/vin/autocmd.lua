local create_autocmd = vim.api.nvim_create_autocmd

-- Close these filetypes with <Esc> in normal mode
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
        "fzf",
        "aerial-nav",
        "dropbar_menu",
    },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.keymap.set(
            "n",
            "q",
            "<cmd>close<CR>",
            { buffer = event.buf, silent = true }
        )
        vim.keymap.set(
            "n",
            "<ESC>",
            "<cmd>close<CR>",
            { buffer = event.buf, silent = true }
        )
    end,
})
