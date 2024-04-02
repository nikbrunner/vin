local M = {}

---@type LazyPluginSpec
M.spec = {
    "nikbrunner/arrow.nvim",
    dev = true,
    dependencies = {
        "WolfeCub/harpeek.nvim",
        keys = {
            {
                "<leader>M",
                function()
                    require("harpeek").toggle()
                end,
                desc = "[M]arks Preview",
            },
        },
        opts = {
            -- You can replace the hightlight group used on the currently selected buffer
            hl_group = "CursorLineNr",
            -- You can override any window options. For example here we set a different position & border.
            winopts = {
                title = "Bookmarks",
                row = 0.85,
                col = vim.o.columns,
                border = "solid",
            },
            format = "relative",
        },
        config = function(_, opts)
            require("harpeek").setup(opts)
        end,
    },
    event = { "VeryLazy" },
    keys = {
        {
            "H",
            function()
                require("arrow.persist").previous()
            end,
            desc = "Previous Marked File",
        },
        {
            "L",
            function()
                require("arrow.persist").next()
            end,
            desc = "Next Marked File",
        },
    },
    opts = {
        leader_key = "<leader>m",
        show_icons = true,
        always_show_path = true,
        separate_by_branch = true,
        mappings = {
            edit = "e",
            delete_mode = "d",
            clear_all_items = "C",
            toggle = "a",
            open_vertical = "v",
            open_horizontal = "s",
            quit = "q",
        },
        window = {
            border = "solid",
        },
    },
}

return M.spec
