local M = {}

-- TODO:  try out grapple instead
---@type LazyPluginSpec
M.spec = {
    "otavioschwanck/arrow.nvim",
    enabled = false,
    opts = {
        leader_key = nil,
        buffer_leader_key = "m",
        show_icons = false,
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
    keys = {
        {
            "<leader>m",
            function()
                require("arrow.ui").openMenu()
            end,
            desc = "[M]arks",
        },
    },
}

return M.spec
