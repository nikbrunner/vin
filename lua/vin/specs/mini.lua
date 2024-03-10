local M = {}

---@type LazyPluginSpec[]
M.specs = {
    {
        "echasnovski/mini.comment",
        event = "VeryLazy",
        opts = {
            options = {
                custom_commentstring = function()
                    return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
                end,
            },
        },
        config = function(_, opts)
            require("mini.comment").setup(opts)
        end,
    },

    {
        "echasnovski/mini.surround",
        version = "*",
        event = "VeryLazy",
        opts = {
            mappings = {
                add = "Sa", -- Add surrounding in Normal and Visual modes
                delete = "Sd", -- Delete surrounding
                find = "Sf", -- Find surrounding (to the right)
                find_left = "SF", -- Find surrounding (to the left)
                highlight = "Sh", -- Highlight surrounding
                replace = "Sr", -- Replace surrounding
                update_n_lines = "Sn", -- Update `n_lines`
            },
        },
    },

    {
        "echasnovski/mini.notify",
        version = "*",
        event = "VeryLazy",
        enabled = true,
        keys = {
            {
                "<leader>un",
                function()
                    require("mini.notify").show_history()
                end,
                desc = "[N]otifications History",
            },
        },
        opts = {
            lsp_progress = {
                -- oh god please stop annoying me
                enable = true,
            },

            window = {
                -- https://github.com/echasnovski/mini.nvim/blob/a118a964c94543c06d8b1f2f7542535dd2e19d36/doc/mini-notify.txt#L186-L198
                config = function()
                    local has_statusline = vim.o.laststatus > 0
                    local bottom_space = vim.o.cmdheight + (has_statusline and 1 or 0)

                    return {
                        anchor = "SE",
                        col = vim.o.columns,
                        row = vim.o.lines - bottom_space,
                        width = math.floor(vim.o.columns * 0.4),
                        border = "solid",
                    }
                end,
                winblend = 30,
            },
        },
        config = function(_, opts)
            require("mini.notify").setup(opts)

            -- Wrap all vim.notify calls with mini.notify
            vim.notify = require("mini.notify").make_notify()
        end,
    },
}

return M.specs
