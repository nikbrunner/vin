local M = {}

---@type LazySpec[]
M.specs = {
    {
        "echasnovski/mini.surround",
        version = "*",
        event = "VeryLazy",
        opts = {
            mappings = {
                add = "gsa", -- Add surrounding in Normal and Visual modes
                delete = "gsd", -- Delete surrounding
                find = "gsf", -- Find surrounding (to the right)
                find_left = "gsF", -- Find surrounding (to the left)
                highlight = "gsh", -- Highlight surrounding
                replace = "gsr", -- Replace surrounding
                update_n_lines = "gsn", -- Update `n_lines`
            },
        },
    },

    {
        "echasnovski/mini.clue",
        version = "*",
        event = "VeryLazy",
        config = function()
            local miniclue = require("mini.clue")
            miniclue.setup({
                triggers = {
                    -- Leader triggers
                    { mode = "n", keys = "<Leader>" },
                    { mode = "v", keys = "<Leader>" },
                    { mode = "x", keys = "<Leader>" },

                    -- Built-in completion
                    { mode = "i", keys = "<C-x>" },

                    -- `g` key
                    { mode = "n", keys = "g" },
                    { mode = "x", keys = "g" },

                    -- prev/next
                    { mode = "n", keys = "]" },
                    { mode = "n", keys = "[" },

                    -- Marks
                    { mode = "n", keys = "'" },
                    { mode = "n", keys = "`" },
                    { mode = "x", keys = "'" },
                    { mode = "x", keys = "`" },

                    -- Registers
                    { mode = "n", keys = '"' },
                    { mode = "x", keys = '"' },
                    { mode = "i", keys = "<C-r>" },
                    { mode = "c", keys = "<C-r>" },

                    -- Window commands
                    { mode = "n", keys = "<C-w>" },

                    -- `z` key
                    { mode = "n", keys = "z" },
                    { mode = "x", keys = "z" },
                },

                -- Clue window settings
                window = {
                    -- Delay before showing clue window
                    delay = 250,

                    -- Keys to scroll inside the clue window
                    scroll_down = "<C-d>",
                    scroll_up = "<C-u>",

                    config = {
                        width = "auto",
                    },
                },

                clues = {
                    { mode = "n", keys = "<leader>.", desc = "TMUX" },
                    { mode = "n", keys = "<leader>c", desc = "Code Actions" },
                    { mode = "n", keys = "<leader>cc", desc = "Copy Actions" },
                    { mode = "n", keys = "<leader>ci", desc = "Code AI Actions" },
                    { mode = "n", keys = "<leader>e", desc = "Explorer" },
                    { mode = "n", keys = "<leader>f", desc = "File & Find" },
                    { mode = "n", keys = "<leader>fp", desc = "Preview (Markdown)" },
                    { mode = "n", keys = "<leader>g", desc = "Git" },
                    { mode = "n", keys = "<leader>gb", desc = "Buffer" },
                    { mode = "n", keys = "<leader>gh", desc = "Hunks" },
                    { mode = "n", keys = "<leader>v", desc = "Vin" },
                    { mode = "n", keys = "<leader>vt", desc = "Terra" },
                    { mode = "n", keys = "<leader>q", desc = "Quit" },
                    { mode = "n", keys = "<leader>s", desc = "Search" },
                    { mode = "n", keys = "<leader>m", desc = "Marks" },
                    { mode = "n", keys = "<leader>u", desc = "UI" },
                    { mode = "n", keys = "<leader>x", desc = "Diagnostics & Quickfix" },
                    { mode = "n", keys = "<leader>w", desc = "Windows" },
                    { mode = "n", keys = "<leader>S", desc = "Sessions" },
                    { mode = "n", keys = "<leader><tab>", desc = "Tabs" },

                    miniclue.gen_clues.builtin_completion(),
                    miniclue.gen_clues.g(),
                    miniclue.gen_clues.marks(),
                    miniclue.gen_clues.registers(),
                    miniclue.gen_clues.windows(),
                    miniclue.gen_clues.z(),
                },
            })
        end,
    },

    {
        "echasnovski/mini.files",
        enabled = false,
        opts = {
            mappings = {
                close = "q",
                go_in = "l",
                go_in_plus = "<CR>",
                go_out = "h",
                go_out_plus = "<ESC>",
                reset = "<BS>",
                reveal_cwd = "@",
                show_help = "g?",
                synchronize = "s",
            },

            windows = {
                width_focus = 50,
                width_nofocus = 50,
                width_preview = 50,
                preview = true,
            },
        },
        keys = {
            {
                "<leader>fm",
                function()
                    require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
                end,
                desc = "Open mini.files (directory of current file)",
            },
            {
                "<leader>fM",
                function()
                    require("mini.files").open(vim.loop.cwd(), true)
                end,
                desc = "Open mini.files (cwd)",
            },
        },
        config = function(_, opts)
            require("mini.files").setup(opts)
        end,
    },
}

return M.specs
