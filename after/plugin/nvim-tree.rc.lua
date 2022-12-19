local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
    return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
    return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup({
    auto_reload_on_write = true,
    create_in_closed_folder = false,
    disable_netrw = false,
    hijack_cursor = false,
    hijack_netrw = true,
    hijack_unnamed_buffer_when_opening = true,
    ignore_buffer_on_setup = false,
    open_on_setup = false,
    open_on_setup_file = false,
    open_on_tab = false,
    hijack_directories = {
        enable = true,
        auto_open = false,
    },
    ignore_ft_on_setup = {
        "startify",
        "dashboard",
        "alpha",
        "help",
    },
    filters = {
        dotfiles = false,
        custom = {},
        exclude = {},
    },
    renderer = {
        add_trailing = false,
        group_empty = false,
        highlight_git = true,
        highlight_opened_files = "none",
        root_folder_modifier = ":t",
        indent_markers = {
            enable = false,
            icons = {
                corner = "└ ",
                edge = "│ ",
                none = "  ",
            },
        },
        icons = {
            webdev_colors = true,
            git_placement = "before",
            padding = " ",
            symlink_arrow = " ➛ ",
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = true,
            },
            glyphs = {
                default = "",
                symlink = "",
                folder = {
                    arrow_open = vin.icons.ui.ArrowOpen,
                    arrow_closed = vin.icons.ui.ArrowClosed,
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                    symlink_open = "",
                },
                git = {
                    unstaged = "",
                    staged = "S",
                    unmerged = "",
                    renamed = "➜",
                    untracked = "U",
                    deleted = "",
                    ignored = "◌",
                },
            },
        },
    },
    diagnostics = {
        enable = false,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },
    update_focused_file = {
        enable = true,
        update_cwd = false,
        ignore_list = {},
    },
    git = {
        enable = true,
        ignore = false,
        timeout = 500,
    },
    view = {
        adaptive_size = false,
        width = 40,
        centralize_selection = true,
        hide_root_folder = false,
        side = "left",
        -- auto_resize = true,
        mappings = {
            custom_only = false,
            list = {
                { key = { "l", "<CR>", "o" }, cb = tree_cb("edit") },
                { key = "h", cb = tree_cb("close_node") },
                { key = "v", cb = tree_cb("vsplit") },
                { key = "[g", action = "prev_git_item" },
                { key = "]g", action = "next_git_item" },
            },
        },
        number = false,
        relativenumber = false,
    },
})
