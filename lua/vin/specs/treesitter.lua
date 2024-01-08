local M = {}

---@type LazySpec[]
M.specs = {
    {
        "nvim-treesitter/nvim-treesitter",
        ---@diagnostic disable-next-line: assign-type-mismatch
        version = false, -- last release is way too old and doesn't work on Windows
        build = ":TSUpdate",
        event = { "VeryLazy" },
        opts = {
            highlight = {
                enable = true,
                ---@diagnostic disable-next-line: unused-local
                disable = function(lang, bufnr) -- Disable in files with more than 5K
                    return vim.api.nvim_buf_line_count(bufnr) > 5000
                end,
                additional_vim_regex_highlighting = { "markdown" },
            },
            indent = {
                enable = true,
            },
            auto_install = true,
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<CR>",
                    node_incremental = "<CR>",
                    node_decremental = "<BS>",
                },
            },
        },
        config = function(_, opts)
            local configs = require("nvim-treesitter.configs")

            configs.setup(opts)
        end,
    },

    {
        "JoosepAlviste/nvim-ts-context-commentstring",
        dependencies = "nvim-treesitter/nvim-treesitter",
        event = "VeryLazy",
        opts = {
            enable_autocmd = false,
        },
    },

    {
        "nvim-treesitter/nvim-treesitter-context",
        dependencies = "nvim-treesitter/nvim-treesitter",
        event = "VeryLazy",
        enabled = false,
        opts = {
            enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
            max_lines = 6, -- How many lines the window should span. Values <= 0 mean no limit.
            multiline_threshold = 20, -- Maximum number of lines to show for a single context
            trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
            zindex = 20, -- The Z-index of the context window
            mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
            patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
                -- For all filetypes
                -- Note that setting an entry here replaces all other patterns for this entry.
                -- By setting the 'default' entry below, you can control which nodes you want to
                -- appear in the context window.
                default = {
                    "class",
                    "function",
                    "method",
                    "for", -- These won't appear in the context
                    "while",
                    "if",
                    "switch",
                    "case",
                    "const",
                },
            },
        },
        config = function(_, opts)
            local context = require("treesitter-context")
            context.setup(opts)
        end,
    },
}

return M.specs
