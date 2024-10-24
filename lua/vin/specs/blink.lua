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
        keymap = {
            show = "<C-l>",
            hide = { "<S-CR>", "<Left>" },
            accept = { "<CR>", "<Right>" },
            select_prev = { "<Up>" },
            select_next = { "<Down>" },

            show_documentation = "<C-k>",
            hide_documentation = "<C-k>",
            scroll_documentation_up = "<C-b>",
            scroll_documentation_down = "<C-f>",

            snippet_forward = {},
            snippet_backward = {},
        },
        trigger = {
            signature_help = {
                enabled = true,
            },
        },
        highlight = {
            use_nvim_cmp_as_default = true,
        },
    },
}
