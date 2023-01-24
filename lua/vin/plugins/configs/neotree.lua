local present, neotree = pcall(require, "neo-tree")
if not present then
    return
end

vim.g.neo_tree_remove_legacy_commands = 1

neotree.setup({
    filesystem = {
        hijack_netrw_behavior = "open_default",
        -- "open_current",
        -- "disabled",
        follow_current_file = true,
    },
    nesting_rules = {
        ["ts"] = { "spec.ts" },
    },
    event_handlers = {
        {
            event = "file_opened",
            handler = function(file_path)
                --auto close
                -- require("neo-tree").close_all()
            end,
        },
    },
    window = { -- see https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/popup for
        -- possible options. These can also be functions that return these options.
        position = "left", -- left, right, top, bottom, float, current
        width = 40, -- applies to left and right positions
        mappings = {
            ["<space>"] = {
                "toggle_node",
                nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use
            },
            ["<2-LeftMouse>"] = "open",
            ["<cr>"] = "open",
            ["<esc>"] = "revert_preview",
            ["P"] = { "toggle_preview", config = { use_float = true } },
            ["S"] = "open_split",
            -- ["S"] = "split_with_window_picker",
            ["s"] = "open_vsplit",
            -- ["s"] = "vsplit_with_window_picker",
            ["t"] = "open_tabnew",
            -- ["<cr>"] = "open_drop",
            -- ["t"] = "open_tab_drop",
            ["w"] = "open_with_window_picker",
            ["C"] = "close_node",
            ["z"] = "close_all_nodes",
            --["Z"] = "expand_all_nodes",
            ["R"] = "refresh",
            ["a"] = {
                "add",
                -- some commands may take optional config options, see `:h neo-tree-mappings` for details
                config = {
                    show_path = "none", -- "none", "relative", "absolute"
                },
            },
            ["A"] = "add_directory", -- also accepts the config.show_path option.
            ["d"] = "delete",
            ["r"] = "rename",
            ["y"] = "copy_to_clipboard",
            ["x"] = "cut_to_clipboard",
            ["p"] = "paste_from_clipboard",
            ["c"] = "copy", -- takes text input for destination, also accepts the config.show_path option
            ["m"] = "move", -- takes text input for destination, also accepts the config.show_path option
            ["e"] = "toggle_auto_expand_width",
            ["q"] = "close_window",
            ["?"] = "show_help",
            ["<"] = "prev_source",
            [">"] = "next_source",
        },
    },
})
