---@type LazyPluginSpec
return {
    "saghen/blink.cmp",
    lazy = false, -- lazy loading handled internally
    dependencies = "rafamadriz/friendly-snippets",
    version = "v0.*",
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        -- keymap = { preset = "enter" },
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
        windows = {
            autocomplete = {
                border = "solid",
                -- Controls how the completion items are selected
                -- 'preselect' will automatically select the first item in the completion list
                -- 'manual' will not select any item by default
                -- 'auto_insert' will not select any item by default, and insert the completion items automatically when selecting them
                selection = "manual",
            },
        },
    },
}
