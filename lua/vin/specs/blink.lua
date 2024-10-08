return {
    "saghen/blink.cmp",
    enabled = false,
    event = "BufRead",
    dependencies = "rafamadriz/friendly-snippets",
    version = "v0.*",
    opts = {
        keymap = {
            show = "<C-space>",
            hide = "<C-e>",
            accept = "<CR>",
            select_prev = { "<Up>", "<C-j>" },
            select_next = { "<Down>", "<C-k>" },

            show_documentation = {},
            hide_documentation = {},
            scroll_documentation_up = "<C-b>",
            scroll_documentation_down = "<C-f>",

            snippet_forward = "<Tab>",
            snippet_backward = "<S-Tab>",
        },
    },
}
