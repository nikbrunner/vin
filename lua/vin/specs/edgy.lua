local M = {}

---@type LazySpec
M.spec = {
    "folke/edgy.nvim",
    event = "VeryLazy",
    init = function()
        vim.opt.laststatus = 3
        vim.opt.splitkeep = "screen"
    end,
    keys = {
        {
            "<leader>ue",
            function()
                require("edgy").toggle()
            end,
            desc = "Edgy Toggle Windows",
        },
        {
            "<leader>us",
            function()
                require("edgy").select()
            end,
            desc = "Edgy Select Window",
        },
    },
    opts = {
        ---@type table<Edgy.Pos, {size:integer, wo?:vim.wo}>
        animate = {
            enabled = false,
        },

        options = {
            left = { size = 45 },
            bottom = { size = 15 },
            right = { size = 45 },
            top = { size = 10 },
        },

        left = {
            {
                title = "Files",
                ft = "neo-tree",
                filter = function(buf, win)
                    local isFloat = vim.api.nvim_win_get_config(win).relative == ""
                    return isFloat and vim.b[buf].neo_tree_source == "filesystem"
                end,
                pinned = true,
                open = function()
                    vim.api.nvim_input("<esc><space>ee")
                end,
                size = { height = 0.5 },
            },
        },

        right = {
            {
                title = "Git",
                ft = "neo-tree",
                filter = function(buf, win)
                    local isFloat = vim.api.nvim_win_get_config(win).relative == ""
                    return isFloat and vim.b[buf].neo_tree_source == "git_status"
                end,
                pinned = true,
                open = "Neotree position=right git_status",
            },
            {
                title = "Neotest Summary",
                ft = "neotest-summary",
                width = 60,
            },
        },

        bottom = {
            {
                ft = "toggleterm",
                size = { height = 0.4 },
                filter = function(buf, win)
                    return vim.api.nvim_win_get_config(win).relative == ""
                end,
                {
                    ft = "help",
                    size = { height = 0.25 },
                    -- don't open help files in edgy that we're editing
                    filter = function(buf)
                        return vim.bo[buf].buftype == "help"
                    end,
                },
            },
            {
                ft = "noice",
                size = { height = 0.4 },
                filter = function(buf, win)
                    return vim.api.nvim_win_get_config(win).relative == ""
                end,
            },
            {
                ft = "lazyterm",
                title = "LazyTerm",
                size = { height = 0.4 },
                filter = function(buf)
                    return not vim.b[buf].lazyterm_cmd
                end,
            },
            "Trouble",
            {
                ft = "bmessages_buffer",
                title = "Messages",
            },
            {
                ft = "qf",
                title = "QuickFix",
            },
            {
                ft = "spectre_panel",
                size = { height = 0.4 },
            },
            {
                title = "Neotest Output",
                ft = "neotest-output-panel",
                size = { height = 15 },
            },
        },
    },
}

return M.spec
