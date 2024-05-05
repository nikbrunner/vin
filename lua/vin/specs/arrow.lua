local M = {}

---@type LazyPluginSpec
M.spec = {
    "otavioschwanck/arrow.nvim",
    event = "BufEnter",
    opts = {
        leader_key = "<leader>m",
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
}

return M.spec
