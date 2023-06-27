-- TODO: Does this work?
---@type LazySpec
local spec = {
    "echasnovski/mini.surround",
    enabled = true,
    opts = {
        mappings = {
            add = "gza", -- Add surrounding in Normal and Visual modes
            delete = "gzd", -- Delete surrounding
            find = "gzf", -- Find surrounding (to the right)
            find_left = "gzF", -- Find surrounding (to the left)
            highlight = "gzh", -- Highlight surrounding
            replace = "gzr", -- Replace surrounding
            update_n_lines = "gzn", -- Update `n_lines`
        },
    },
    config = function(_, opts)
        require("mini.surround").setup(opts)
    end,
}

return spec
