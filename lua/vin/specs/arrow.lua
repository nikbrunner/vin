local M = {}

---@type LazyPluginSpec
M.spec = {
    "otavioschwanck/arrow.nvim",
    event = { "VeryLazy" },
    keys = {
        {
            "<leader>m",
            function()
                require("arrow.ui").openMenu()
            end,
            desc = "Marks Menu",
        },
        {
            "<C-s>",
            function()
                require("arrow.persist").toggle()
            end,
            desc = "Mark File",
        },
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
        leader_key = nil,
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
