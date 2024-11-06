---@type LazyPluginSpec
return {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = { "MunifTanjim/nui.nvim" },
    keys = {
        { "<leader>vn", "<cmd>Noice log<CR>", desc = "Notifications" },
    },
    opts = {
        cmdline = {
            format = {
                cmdline = { pattern = "^:", icon = " ", lang = "vim" },
            },
        },
        presets = {
            bottom_search = true, -- use a classic bottom cmdline for search
            command_palette = true, -- position the cmdline and popupmenu together
            long_message_to_split = true, -- long messages will be sent to a split
            inc_rename = true, -- enables an input dialog for inc-rename.nvim
            lsp_doc_border = true, -- add a border to hover docs and signature help
        },
        notify = {
            enabled = false,
        },
        lsp = {
            documentation = {
                view = "hover",
                opts = {
                    win_options = { concealcursor = "n", conceallevel = 3 },
                },
            },
        },
        views = {
            cmdline_popup = {
                border = {
                    style = "none",
                    padding = { 2, 6 },
                },
                position = {
                    row = 0.75,
                    col = "50%",
                },
                size = {
                    width = 60,
                    height = "auto",
                },
                filter_options = {},
                win_options = {
                    winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
                },
            },
        },
    },
}
