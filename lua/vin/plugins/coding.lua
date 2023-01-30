return {

    {
        "L3MON4D3/LuaSnip",
        event = "InsertEnter",
        dependencies = {
            "rafamadriz/friendly-snippets",
            config = function()
                require("luasnip.loaders.from_vscode").lazy_load()
            end,
        },
        opts = {
            history = true,
            delete_check_events = "TextChanged",
        },
        keys = {
            {
                "<tab>",
                function()
                    return require("luasnip").jumpable(1)
                            and "<Plug>luasnip-jump-next"
                        or "<tab>"
                end,
                expr = true,
                silent = true,
                mode = "i",
            },
            {
                "<tab>",
                function()
                    require("luasnip").jump(1)
                end,
                mode = "s",
            },
            {
                "<s-tab>",
                function()
                    require("luasnip").jump(-1)
                end,
                mode = { "i", "s" },
            },
        },
    },

    {
        "echasnovski/mini.surround",
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
            -- use gz mappings instead of s to prevent conflict with leap
            require("mini.surround").setup(opts)
        end,
    },

    -- TODO: Replace with mini.pairs
    -- https://github.com/echasnovski/mini.pairs
    {
        "windwp/nvim-autopairs",
        dependencies = "nvim-treesitter/nvim-treesitter",
        event = "VeryLazy",
        opts = {
            check_ts = true,
            ts_config = {
                lua = { "string", "source" },
                javascript = { "string", "template_string" },
                java = false,
            },
            disable_filetype = { "TelescopePrompt", "spectre_panel" },
            fast_wrap = {
                map = "<M-e>",
                chars = { "{", "[", "(", '"', "'" },
                pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
                offset = 0, -- Offset from pattern match
                end_key = "$",
                keys = "qwertyuiopzxcvbnmasdfghjkl",
                check_comma = true,
                highlight = "PmenuSel",
                highlight_grey = "LineNr",
            },
        },
        -- TODO: I propably don't need this either. I assume it defaults to the default setup function
        config = function(_, opts)
            local autopairs = require("nvim-autopairs")

            autopairs.setup(opts)

            -- TODO I don't know if I need this
            local cmp_autopairs = require("nvim-autopairs.completion.cmp")
            local cmp = require("cmp")

            cmp.event:on(
                "confirm_done",
                cmp_autopairs.on_confirm_done({ map_char = { tex = "" } })
            )
        end,
    },

    {
        "chentoast/marks.nvim",
        event = "VeryLazy",
        opts = {
            builtin_marks = { "<", ">", "^" },
            -- sign priorities for each type of mark - builtin marks, uppercase marks, lowercase
            -- marks, and bookmarks.marks
            -- can be either a table with all/none of the keys, or a single number, in which case
            -- the priority applies to all marks.marks
            -- default 10.
            sign_priority = { lower = 10, upper = 15, builtin = 8, bookmark = 20 },
            -- disables mark tracking for specific filetypes. default {}
            excluded_filetypes = {
                "NvimTree",
                "neo-tree",
            },
            mappings = {
                prev = "[m",
                next = "]m",
            },
        },
    },

    {
        "ggandor/leap.nvim",
        event = "VeryLazy",
        dependencies = { { "ggandor/flit.nvim", opts = { labeled_modes = "nv" } } },
        config = function(_, opts)
            local leap = require("leap")
            for k, v in pairs(opts) do
                leap.opts[k] = v
            end
            leap.add_default_mappings(true)
        end,
    },

    {
        "zbirenbaum/copilot.lua",
        event = "InsertEnter",
        dependencies = { "zbirenbaum/copilot-cmp" },
        config = function(_, opts)
            vim.schedule(function()
                local copilot = require("copilot")
                copilot.setup(opts)

                if Vin.config.copilot.suggestions.enable_cmp then
                    local copilot_cmp = require("copilot_cmp")
                    require("copilot_cmp").setup()
                end
            end)
        end,
        opts = {
            panel = {
                enabled = false,
                auto_refresh = false,
                keymap = {
                    jump_prev = "[[",
                    jump_next = "]]",
                    accept = "<CR>",
                    refresh = "gr",
                    open = "<M-y>",
                },
            },
            suggestion = {
                enabled = Vin.config.copilot.suggestions.enable,
                auto_trigger = Vin.config.copilot.suggestions.auto_trigger,
                debounce = 75,
                keymap = {
                    accept = "<C-l>",
                    accept_word = false,
                    accept_line = false,
                    next = "<C-n>",
                    prev = "<C-p>",
                    dismiss = "<C-h>",
                },
            },
            filetypes = {
                yaml = false,
                markdown = true,
                help = false,
                gitcommit = false,
                gitrebase = false,
                hgcommit = false,
                svn = false,
                cvs = false,
                ["."] = false,
            },
            copilot_node_command = "node", -- Node.js version must be > 16.x
        },
    },
}
