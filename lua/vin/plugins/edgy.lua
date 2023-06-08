---@type LazySpec
local spec = {
    "folke/edgy.nvim",
    event = "VeryLazy",
    enabled = false,
    opts = {
        options = {
            left = { size = Vin.config.sidebar_width },
            bottom = { size = 10 },
            right = { size = Vin.config.sidebar_width },
            top = { size = 10 },
        },

        animate = {
            enabled = true,
            fps = 100, -- frames per second
            cps = 120, -- cells per second
            on_begin = function()
                vim.g.minianimate_disable = true
            end,
            on_end = function()
                vim.g.minianimate_disable = false
            end,
            -- Spinner for pinned views that are loading.
            -- if you have noice.nvim installed, you can use any spinner from it, like:
            -- spinner = require("noice.util.spinners").spinners.circleFull,
            spinner = {
                frames = {
                    "⠋",
                    "⠙",
                    "⠹",
                    "⠸",
                    "⠼",
                    "⠴",
                    "⠦",
                    "⠧",
                    "⠇",
                    "⠏",
                },
                interval = 80,
            },
        },

        bottom = {
            -- toggleterm / lazyterm at the bottom with a height of 40% of the screen
            {
                ft = "toggleterm",
                size = { height = 0.4 },
                -- exclude floating windows
                filter = function(_, win)
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
            { ft = "qf", title = "QuickFix" },
            {
                ft = "help",
                size = { height = 30 },
                -- only show help buffers
                filter = function(buf)
                    return vim.bo[buf].buftype == "help"
                end,
            },
            { ft = "spectre_panel", size = { height = 0.4 } },
        },

        left = {
            {
                title = "Files",
                ft = "neo-tree",
                pinned = true,
                filter = function(buf, win)
                    local isFileTree = vim.b[buf].neo_tree_source == "filesystem"

                    -- if it is not floating and is a file tree
                    return isFileTree
                end,
                size = { height = 0.5 },
            },

            {
                title = "Buffers",
                ft = "neo-tree",
                pinned = true,
                open = "Neotree position=top buffers",
                filter = function(buf)
                    return vim.b[buf].neo_tree_source == "buffers"
                end,
            },
        },

        ---@type (Edgy.View.Opts|string)[]
        right = {
            {
                title = "Outline",
                ft = "lspsagaoutline",
                open = "Lspsaga outline",
            },
            {
                title = "Git",
                ft = "neo-tree",
                pinned = true,
                open = "Neotree position=right git_status",
                size = { height = 0.5 },
                filter = function(buf)
                    local isFloat = vim.api.nvim_win_get_config(win).relative == ""
                    print("Test: edgy.lua [[isFloat]]", isFloat)
                    return vim.b[buf].neo_tree_source == "git_status"
                end,
            },
        },
    },
}

return spec
