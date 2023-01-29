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
            autotag = { -- QUESTION: Need?
                enable = false,
            },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
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
}
