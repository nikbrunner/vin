---@type LazyPluginSpec
return {
    "Chaitanyabsprip/fastaction.nvim",
    event = "BufRead",
    enabled = false, -- [Get "no code actions available" even if code actions are available with `vim.lsp.buf.code_action` · Issue #22 · Chaitanyabsprip/fastaction.nvim](https://github.com/Chaitanyabsprip/fastaction.nvim/issues/22)
    ---@module "fastaction"
    ---@type FastActionConfig
    opts = {
        dismiss_keys = { "j", "k", "<c-c>", "q" },
        keys = "qwertyuiopasdfghlzxcvbnm",
        popup = {
            relative = "cursor",
            border = "solid",
            hide_cursor = true,
            highlight = {
                divider = "FloatBorder",
                key = "MoreMsg",
                title = "Title",
                window = "NormalFloat",
            },
            title = "Select one of:",
        },
        priority = {
            javascript = {
                { pattern = "add braces", key = "a", order = 1 },
            },
            javascriptreact = {
                { pattern = "add braces", key = "a", order = 1 },
            },
            typescript = {
                { pattern = "add braces", key = "a", order = 1 },
            },
            typescriptreact = {
                { pattern = "add braces", key = "a", order = 1 },
            },
        },
    },
    keys = {
        {
            "g.",
            function()
                require("fastaction").code_action()
            end,
            desc = "Code Action",
        },
        {
            "g.",
            mode = "v",
            function()
                require("fastaction").range_code_action()
            end,
            desc = "Code Action",
        },
    },
}
