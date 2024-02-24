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
                border = "single",
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
                ["gz"] = { name = "Surround" },
                ["]"] = { name = "Next" },
                ["["] = { name = "Prev" },

                ["<leader>."] = { name = "TMUX" },
                ["<leader>c"] = { name = "Code" },
                ["<leader>cc"] = { name = "Copy" },
                ["<leader>e"] = { name = "Explorer" },
                ["<leader>f"] = { name = "File & Find" },
                ["<leader>g"] = { name = "Git" },
                ["<leader>gb"] = { name = "Buffer" },
                ["<leader>gh"] = { name = "Hunks" },
                ["<leader>v"] = { name = "Vin" },
                ["<leader>b"] = { name = "Black Atom" },
                ["<leader>s"] = { name = "Search" },
                ["<leader>i"] = { name = "Intelligence" },
                ["<leader>u"] = { name = "UI" },
                ["<leader>x"] = { name = "Diagnostics & Quickfix" },

                -- TODO: placeholder
                ["<leader>w"] = { name = "Workspace" },
                ["<leader>d"] = { name = "Document" },
                ["<leader>t"] = { name = "Test" },
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
