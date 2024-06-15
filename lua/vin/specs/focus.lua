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
            minwidth = 10, -- Force minimum width for the unfocused window
            minheight = 5, -- Force minimum height for the unfocused window
        },
        ui = {
            signcolumn = false, -- Display signcolumn in the focussed window only
        },
    },
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
