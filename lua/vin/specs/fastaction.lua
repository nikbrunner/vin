---@type LazyPluginSpec
return {
    "Chaitanyabsprip/fastaction.nvim",
    event = "BufRead",
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
            typescript = {
                { pattern = "add braces", key = "a", order = 1 },
            },
            typescriptreact = {
                { pattern = "add braces", key = "a", order = 1 },
            },
        },
        register_ui_select = true,
    },
}
