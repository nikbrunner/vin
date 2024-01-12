local M = {}

---@type LazySpec
M.spec = {
    "otavioschwanck/arrow.nvim",
    event = "BufRead",
    opts = {
        show_icons = true,
        always_show_path = true,
        leader_key = "m",
        mappings = {
            edit = "e",
            delete_mode = "d",
            clear_all_items = "C",
            toggle = "a",
            open_vertical = "v",
            open_horizontal = "s",
            quit = "q",
        },
    },
}

return M.spec