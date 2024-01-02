local M = {}

---@type LazySpec
M.spec = {
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
            },

            clues = {
                -- Enhance this by adding descriptions for <Leader> mapping groups
                miniclue.gen_clues.builtin_completion(),
                miniclue.gen_clues.g(),
                miniclue.gen_clues.marks(),
                miniclue.gen_clues.registers(),
                miniclue.gen_clues.windows(),
                miniclue.gen_clues.z(),
            },
        })
    end,
}

return M.spec
