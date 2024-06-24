local M = {}

---@type LazyPluginSpec
M.spec = {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = true,
    branch = "v3.x",
    event = "VeryLazy",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
    },
    ---@diagnostic disable-next-line: assign-type-mismatch
    keys = function()
        local function close_side_panels()
            vim.cmd("Neotree left close")
            vim.cmd("Neotree right close")
        end

        return {
            {
                "<leader>ee",
                function()
                    vim.cmd("Neotree left toggle reveal")
                end,
                desc = "[E]xplorer",
            },
            {
                "<leader>ef",
                function()
                    close_side_panels()
                    vim.cmd("Neotree float toggle reveal")
                end,
                desc = "[F]iles",
            },
            {
                "<C-e>",
                function()
                    close_side_panels()
                    vim.cmd("Neotree float toggle reveal")
                end,
                desc = "[F]iles",
            },
            {
                "<leader>eg",
                function()
                    close_side_panels()
                    vim.cmd("Neotree float git_status toggle reveal")
                end,
                desc = "[G]it Status",
            },
            {
                "<leader>er",
                function()
                    close_side_panels()
                    vim.cmd("Neotree float buffers toggle reveal")
                end,
                desc = "[R]ecents",
            },
        }
    end,
    --- https://github.com/nvim-neo-tree/neo-tree.nvim/blob/v3.x/lua/neo-tree/defaults.lua
    opts = function()
        local icons = require("vin.icons")
        return {
            default_component_configs = {
                indent = {
                    with_markers = false,
                    expander_collapsed = "",
                    expander_expanded = "",
                },
                diagnostics = {
                    symbols = {
                        hint = icons.diagnostics.Hint,
                        info = icons.diagnostics.Info,
                        warn = icons.diagnostics.Warn,
                        error = icons.diagnostics.Error,
                    },
                },
                git_status = {
                    symbols = {
                        added = icons.git.added,
                        deleted = icons.git.removed,
                        modified = icons.git.modified,
                        renamed = icons.git.renamed,
                        untracked = icons.git.untracked,
                        ignored = icons.git.ignored,
                        unstaged = icons.git.unstaged,
                        staged = icons.git.staged,
                        conflict = icons.git.conflict,
                    },
                },
                icon = {
                    folder_closed = icons.misc.chevron_small_right,
                    folder_open = icons.misc.chevron_small_down,
                    folder_empty = icons.misc.chevron_small_right,
                    folder_empty_open = icons.misc.chevron_small_down,
                    default = "",
                },
            },
            add_blank_line_at_top = true,
            hide_root_node = true,
            sources = {
                "filesystem",
                "buffers",
                "git_status",
                "document_symbols",
            },
            -- nesting_rules = {
            --     ["package.json"] = {
            --         pattern = "^package%.json$", -- <-- Lua pattern
            --         files = { "package-lock.json", "yarn*" }, -- <-- glob pattern
            --     },
            --     ["go"] = {
            --         pattern = "(.*)%.go$", -- <-- Lua pattern with capture
            --         files = { "%1_test.go" }, -- <-- glob pattern with capture
            --     },
            --     ["ts"] = { "spec.ts" },
            -- },
            filesystem = {
                hijack_netrw_behavior = "disabled",
                use_libuv_file_watcher = true, -- This will use the OS level file watchers to detect changes
                follow_current_file = {
                    enabled = true, -- This will find and focus the file in the active buffer every time the current file is changed while the tree is open.
                },
                -- the current file is changed while the tree is open.
                filtered_items = {
                    visible = false, -- when true, they will just be displayed differently than normal items
                    force_visible_in_empty_folder = false, -- when true, hidden files will be shown if the root folder is otherwise empty
                    show_hidden_count = true, -- when true, the number of hidden items in each folder will be shown as the last entry
                    hide_dotfiles = false,
                    hide_gitignored = true,
                    hide_hidden = false, -- only works on Windows for hidden files/directories
                    always_show = { -- remains visible even if other settings would normally hide it
                        ".gitignore",
                    },
                    never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
                        ".DS_Store",
                        "thumbs.db",
                    },
                },
            },
            source_selector = {
                winbar = false,
                show_scrolled_off_parent_node = true,
                statusline = false, -- toggle to show selector on statusline
                content_layout = "center",
                tabs_layout = "equal",
                sources = { -- table
                    {
                        source = "filesystem", -- string
                        display_name = " 󰉓 Files ", -- string | nil
                    },
                    {
                        source = "buffers", -- string
                        display_name = " 󰈚 Buffers ", -- string | nil
                    },
                    {
                        source = "git_status", -- string
                        display_name = " 󰊢 Git ", -- string | nil
                    },
                },
            },

            event_handlers = {
                {
                    event = "neo_tree_window_after_open",
                    handler = function()
                        vim.cmd("wincmd =")
                    end,
                },

                {
                    event = "neo_tree_window_after_close",
                    handler = function()
                        vim.cmd("wincmd =")
                    end,
                },
            },

            window = {
                position = "left",
                width = 0.2,
                -- https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/popup
                popup = {
                    position = "50%", -- 50% means center it
                    size = {
                        height = 35,
                        width = 65,
                    },
                    border = {
                        padding = { 2, 8 },
                        -- style = "solid",
                        -- text = {
                        --     top = "[ Vin ]",
                        --     top_align = "center",
                        --     bottom = require("vin.icons").misc.circle,
                        --     bottom_align = "center",
                        -- },
                    },
                },
                mappings = {
                    ["<space>"] = false,
                    ["l"] = "toggle_node",
                    ["<2-LeftMouse>"] = "open",
                    ["<cr>"] = "open",
                    ["L"] = "open",
                    ["<esc>"] = "revert_preview",
                    ["P"] = { "toggle_preview", config = { use_float = true } },
                    ["s"] = "open_split",
                    ["S"] = "split_with_window_picker",
                    ["v"] = "open_vsplit",
                    ["V"] = "vsplit_with_window_picker",
                    ["t"] = "open_tabnew",
                    ["w"] = "open_with_window_picker",
                    ["O"] = function(state)
                        local node = state.tree:get_node()
                        local path = node:get_id()
                        vim.ui.open(path)
                    end,
                    ["M"] = "close_all_nodes",
                    ["R"] = "refresh",
                    ["a"] = { "add", config = { show_path = "relative" } }, -- "none", "relative", "absolute"
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
        }
    end,
    config = function(_, opts)
        require("neo-tree").setup(opts)
    end,
}

return M.spec
