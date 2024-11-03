---Issue to watch for labels:
---[Feature Request: Add Label Details (Display Source) on Autocomplete · Issue #97 · Saghen/blink.cmp](https://github.com/Saghen/blink.cmp/issues/97)
---@type LazyPluginSpec
return {
    "saghen/blink.cmp",
    enabled = true,
    event = "BufRead",
    dependencies = "rafamadriz/friendly-snippets",
    version = "v0.*",
    opts = {
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
                min_width = 15,
                max_height = 10,
                border = "solid",
                selection = "auto_insert",
            },
        },
        highlight = {
            use_nvim_cmp_as_default = false,
        },
    },
}
