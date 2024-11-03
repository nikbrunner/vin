---TODO: This should work now, but it doesn't show as a column. Triggering the documentation with <C-space> does show the source.
---Maybe this can be improved in the future.
---[Feature Request: Add Label Details (Display Source) on Autocomplete · Issue #97 · Saghen/blink.cmp](https://github.com/Saghen/blink.cmp/issues/97)

---@type LazyPluginSpec
return {
    "saghen/blink.cmp",
    event = "BufRead",
    dependencies = "rafamadriz/friendly-snippets",
    version = "v0.*",
    ---@type blink.cmp.Config
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
                border = "solid",
                selection = "auto_insert",
            },
        },
    },
}
