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
                -- Controls how the completion items are selected
                -- 'preselect' will automatically select the first item in the completion list
                -- 'manual' will not select any item by default
                -- 'auto_insert' will not select any item by default, and insert the completion items automatically when selecting them
                selection = "auto_insert",
            },
        },
        highlight = {
            use_nvim_cmp_as_default = false,
        },
    },
}
