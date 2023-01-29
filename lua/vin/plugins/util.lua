return {
    { "nvim-lua/popup.nvim" }, -- QUESTION: Need?

    {
        "kazhala/close-buffers.nvim",
        event = "VeryLazy",
    },

    {
        "s1n7ax/nvim-window-picker",
        event = "VeryLazy",
        version = "v1.*",
    },

    {
        "wellle/targets.vim",
        event = "VeryLazy",
    },

    {
        "davidgranstrom/nvim-markdown-preview",
        lazy = false,
    },

    {
        "folke/persistence.nvim",
        event = "BufReadPre",
        opts = { options = { "buffers", "curdir", "tabpages", "winsize", "help" } },
    },

    {
        "RRethy/vim-illuminate",
        event = "BufReadPost",
        opts = { delay = 200 },
        config = function(_, opts)
            require("illuminate").configure(opts)
            vim.api.nvim_create_autocmd("FileType", {
                callback = function()
                    local buffer = vim.api.nvim_get_current_buf()
                    pcall(vim.keymap.del, "n", "]]", { buffer = buffer })
                    pcall(vim.keymap.del, "n", "[[", { buffer = buffer })
                end,
            })
        end,
        keys = {
            {
                "]]",
                function()
                    require("illuminate").goto_next_reference(false)
                end,
                desc = "Next Reference",
            },
            {
                "[[",
                function()
                    require("illuminate").goto_prev_reference(false)
                end,
                desc = "Prev Reference",
            },
        },
    },
}
