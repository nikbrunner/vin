---@diagnostic disable: inject-field
local M = {}

M.state = {
    is_maximized = false,
}

---@type LazySpec
M.spec = {
    "nvim-focus/focus.nvim",
    version = false,
    event = "VeryLazy",
    opts = {
        autoresize = {
            minwidth = 35, -- Force minimum width for the unfocused window
            minheight = 5, -- Force minimum height for the unfocused window
        },
        ui = {
            signcolumn = false, -- Display signcolumn in the focussed window only
        },
    },
    config = function(_, opts)
        require("focus").setup(opts)

        local ignore_filetypes = { "neo-tree", "trouble" }
        local ignore_buftypes = { "nofile", "prompt", "popup", "quickfix" }

        local augroup = vim.api.nvim_create_augroup("FocusDisable", { clear = true })

        vim.api.nvim_create_autocmd("WinEnter", {
            group = augroup,
            callback = function(_)
                if vim.tbl_contains(ignore_buftypes, vim.bo.buftype) then
                    vim.w.focus_disable = true
                else
                    vim.w.focus_disable = false
                end
            end,
            desc = "Disable focus autoresize for BufType",
        })

        vim.api.nvim_create_autocmd("FileType", {
            group = augroup,
            callback = function(_)
                if vim.tbl_contains(ignore_filetypes, vim.bo.filetype) then
                    vim.b.focus_disable = true
                else
                    vim.b.focus_disable = false
                end
            end,
            desc = "Disable focus autoresize for FileType",
        })
    end,
    keys = {
        {
            "M",
            function()
                if M.is_maximized then
                    vim.cmd("FocusEqualise")
                    M.is_maximized = false
                else
                    vim.cmd("FocusMaximise")
                    M.is_maximized = true
                end
            end,
            desc = "[M]aximize Split",
        },
        {
            "<leader>h",
            function()
                require("focus").split_command("h")
            end,
            desc = "Split to Left",
        },
        {
            "<leader>j",
            function()
                require("focus").split_command("j")
            end,
            desc = "Split to Bottom",
        },
        {
            "<leader>k",
            function()
                require("focus").split_command("k")
            end,
            desc = "Split to Top",
        },
        {
            "<leader>l",
            function()
                require("focus").split_command("l")
            end,
            desc = "Split to Right",
        },
    },
}

return M.spec
