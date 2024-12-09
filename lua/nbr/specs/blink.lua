---@type LazyPluginSpec
return {
    "saghen/blink.cmp",
    lazy = false, -- lazy loading handled internally
    dependencies = "rafamadriz/friendly-snippets",
    version = "v0.*",
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        keymap = {
            ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
            ["<C-e>"] = { "hide" },
            ["<C-y>"] = { "select_and_accept" },

            ["<Up>"] = { "select_prev", "fallback" },
            ["<Down>"] = { "select_next", "fallback" },

            ["<C-b>"] = { "scroll_documentation_up", "fallback" },
            ["<C-f>"] = { "scroll_documentation_down", "fallback" },

            ["<Tab>"] = { "snippet_forward", "fallback" },
            ["<S-Tab>"] = { "snippet_backward", "fallback" },
        },
        sources = {
            -- add lazydev to your completion providers
            completion = {
                enabled_providers = { "lsp", "path", "snippets", "buffer", "lazydev" },
            },
            providers = {
                -- dont show LuaLS require statements when lazydev has items
                lsp = { fallback_for = { "lazydev" } },
                lazydev = { name = "LazyDev", module = "lazydev.integrations.blink" },
            },
        },
        trigger = {
            signature_help = {
                enabled = true,
            },
        },
        completion = {
            list = {
                -- Controls how the completion items are selected
                -- 'preselect' will automatically select the first item in the completion list
                -- 'manual' will not select any item by default
                -- 'auto_insert' will not select any item by default, and insert the completion items automatically when selecting them
                selection = "auto_insert",
            },

            menu = {
                border = "solid",
                winblend = 10,
                -- Whether to automatically show the window when new completion items are available
                auto_show = true,

                -- Controls how the completion items are rendered on the popup window
                draw = {
                    -- Aligns the keyword you've typed to a component in the menu
                    align_to_component = "label", -- or 'none' to disable
                    -- Left and right padding, optionally { left, right } for different padding on each side
                    padding = 1,
                    -- Gap between columns
                    gap = 1,

                    -- Components to render, grouped by column
                    columns = { { "kind_icon" }, { "label", "label_description", gap = 1 } },
                    -- for a setup similar to nvim-cmp: https://github.com/Saghen/blink.cmp/pull/245#issuecomment-2463659508
                    -- columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind" } },
                },
            },
        },
    },
}
