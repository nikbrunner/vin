
    -- TODO: Replace with mini.pairs
    -- https://github.com/echasnovski/mini.pairs
    return {
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
    }
