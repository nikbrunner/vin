local M = {}

---@type LazyPluginSpec
M.spec = {
    "folke/which-key.nvim",
    event = "VeryLazy",
    enabled = true,
    opts = function(_, default_opts)
        return vim.tbl_deep_extend("force", default_opts, {
            plugins = {
                marks = true, -- shows a list of your marks on ' and `
                registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
                spelling = true,
            },

            key_labels = {
                ["<SPACE>"] = "SPC",
                ["<space>"] = "SPC",
                ["<CR>"] = "RET",
                ["<cr>"] = "RET",
                ["<TAB>"] = "TAB",
                ["<tab>"] = "TAB",
            },

            icons = {
                breadcrumb = "/",
                separator = "",
            },

            popup_mappings = {
                scroll_down = "<c-d>",
                scroll_up = "<c-u>",
            },

            window = {
                border = "none",
                position = "bottom",
                margin = { 1, 0, 1, 0 },
                padding = { 1, 1, 1, 1 },
                winblend = 0,
            },

            layout = {
                height = { min = 5, max = 10 },
                width = { min = 20, max = 50 },
                spacing = 5,
                align = "center",
            },

            defaults = {
                mode = { "n", "v" },
                ["g"] = { name = "GoTo" },
                ["S"] = { name = "Surround" },

                ["]"] = { name = "Next" },
                ["["] = { name = "Prev" },

                ["<leader>a"] = { name = "[A]ction" },
                ["<leader>ac"] = { name = "[C]opy" },
                ["<leader>al"] = { name = "[L]og" },
                ["<leader>e"] = { name = "[E]xplorer" },
                ["<leader>f"] = { name = "[F]ind" },
                ["<leader>g"] = { name = "[G]it" },
                ["<leader>gb"] = { name = "[B]uffer" },
                ["<leader>gh"] = { name = "[H]unks" },
                ["<leader>v"] = { name = "[V]in" },
                ["<leader>s"] = { name = "[S]earch" },
                ["<leader>t"] = { name = "[T]MUX" },
                ["<leader>i"] = { name = "[I]ntelligence" },
                ["<leader>ic"] = { name = "[C]opilot" },
                ["<leader>u"] = { name = "[U]I" },
                ["<leader>d"] = { name = "[D]iagnostics" },
            },
        })
    end,
    config = function(_, opts)
        local wk = require("which-key")
        wk.setup(opts)
        wk.register(opts.defaults)
    end,
}

return M.spec
