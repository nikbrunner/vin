return {
    {
        "nvim-treesitter/nvim-treesitter",
        version = false, -- last release is way too old and doesn't work on Windows
        build = ":TSUpdate",
        event = "BufReadPost",
        keys = {
            { "<c-space>", desc = "Increment selection" },
            { "<bs>", desc = "Schrink selection", mode = "x" },
        },
        opts = {
            ensure_installed = Vin.config.syntax.ensure_installed, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
            autotag = {
                enable = true,
            },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = { "markdown" },
            },
            indent = { enable = true },
            -- DOCS: https://github.com/JoosepAlviste/nvim-ts-context-commentstring
            context_commentstring = {
                enable = true,
                enable_autocmd = false,
                config = {
                    -- Languages that have a single comment style
                    typescript = "// %s",
                    css = "/* %s */",
                    scss = "/* %s */",
                    html = "<!-- %s -->",
                    svelte = "<!-- %s -->",
                    vue = "<!-- %s -->",
                    json = "",
                },
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<CR>",
                    node_incremental = "<CR>",
                    scope_incremental = "<S-CR>",
                    node_decremental = "<BS>",
                },
            },
            playground = {
                enable = false,
                disable = {},
                updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
                persist_queries = false, -- Whether the query persists across vim sessions
                keybindings = {
                    toggle_query_editor = "o",
                    toggle_hl_groups = "i",
                    toggle_injected_languages = "t",
                    toggle_anonymous_nodes = "a",
                    toggle_language_display = "I",
                    focus_language = "f",
                    unfocus_language = "F",
                    update = "R",
                    goto_node = "<cr>",
                    show_help = "?",
                },
            },
            rainbow = {
                enable = true,
                extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
                max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
            },
        },
        config = function(_, opts)
            local parser_config =
                require("nvim-treesitter.parsers").get_parser_configs()

            parser_config.embedded_template = {
                install_info = {
                    url = "https://github.com/tree-sitter/tree-sitter-embedded-template",
                    files = { "src/parser.c" },
                    requires_generate_from_grammar = false,
                },
            }

            vim.treesitter.language.register("embedded_template", "ejs")

            require("nvim-treesitter.configs").setup(opts)
        end,
    },

    {
        "nvim-treesitter/playground",
        dependencies = "nvim-treesitter/nvim-treesitter",
        event = "VeryLazy",
        build = function()
            local present, _ = pcall(vim.cmd, "TSInstall")
            if present then
                vim.cmd("TSInstall query")
            end
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = "nvim-treesitter/nvim-treesitter",
        event = "VeryLazy",
    },

    {
        "windwp/nvim-ts-autotag",
        dependencies = "nvim-treesitter/nvim-treesitter",
        event = "VeryLazy",
    },

    {
        "JoosepAlviste/nvim-ts-context-commentstring",
        dependencies = "nvim-treesitter/nvim-treesitter",
        event = "VeryLazy",
        init = function()
            local comment = require("Comment")
            comment.setup({
                pre_hook = require(
                    "ts_context_commentstring.integrations.comment_nvim"
                ).create_pre_hook(),
            })
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter-context",
        dependencies = "nvim-treesitter/nvim-treesitter",
        event = "VeryLazy",
        opts = {
            enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
            max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
            trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
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
                -- Example for a specific filetype.
                -- If a pattern is missing, *open a PR* so everyone can benefit.
                --   rust = {
                --       'impl_item',
                --   },
            },
            exact_patterns = {
                -- Example for a specific filetype with Lua patterns
                -- Treat patterns.rust as a Lua pattern (i.e "^impl_item$" will
                -- exactly match "impl_item" only)
                -- rust = true,
            },

            -- [!] The options below are exposed but shouldn't require your attention,
            --     you can safely ignore them.

            zindex = 20, -- The Z-index of the context window
            mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
        },
        config = function(_, opts)
            local context = require("treesitter-context")
            context.setup(opts)
        end,
    },
}
