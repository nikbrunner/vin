local M = {}

---@type LazyPluginSpec[]
M.specs = {
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
        lazy = false,
        enabled = true,
        keys = {
            {
                "<leader>vn",
                function()
                    require("mini.notify").show_history()
                end,
                desc = "[N]otifications History",
            },
        },
        opts = {
            lsp_progress = {
                -- oh god please stop annoying me
                enable = false,
            },

            window = {
                -- https://github.com/echasnovski/mini.nvim/blob/a118a964c94543c06d8b1f2f7542535dd2e19d36/doc/mini-notify.txt#L186-L198
                config = {
                    anchor = "SE",
                    col = vim.o.columns,
                    row = vim.o.lines - 2,
                    width = math.floor(vim.o.columns * 0.5),
                    border = "solid",
                },
                winblend = 10,
            },
        },
        config = function(_, opts)
            require("mini.notify").setup(opts)

            -- Wrap all vim.notify calls with mini.notify
            vim.notify = require("mini.notify").make_notify()
        end,
    },

    {
        "echasnovski/mini.icons",
        enabled = false,
        event = "VeryLazy",
        opts = {},
        init = function()
            -- QUESTION: why, and how long is this needed?
            package.preload["nvim-web-devicons"] = function()
                -- needed since it will be false when loading and mini will fail
                package.loaded["nvim-web-devicons"] = {}
                require("mini.icons").mock_nvim_web_devicons()
                return package.loaded["nvim-web-devicons"]
            end
        end,
    },
}

return M.specs
