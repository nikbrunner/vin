local lib = require("vin.lib")

local M = {}

---@type LazySpec
M.spec = {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    event = "VeryLazy",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
        -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
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
                    vim.cmd("Neotree left filesystem toggle reveal")
                end,
                desc = "Files",
            },
            {
                "<leader>eg",
                function()
                    vim.cmd("Neotree right git_status toggle reveal")
                end,
                desc = "Git Status",
            },
            {
                "<leader>eb",
                function()
                    vim.cmd("Neotree left buffers toggle reveal")
                end,
                desc = "Buffers",
            },
            {
                "<leader>es",
                function()
                    vim.cmd("Neotree right document_symbols toggle reveal")
                end,
                desc = "Document Symbols",
            },
            {
                "<C-f>",
                function()
                    close_side_panels()
                    vim.cmd("Neotree float toggle reveal")
                end,
                desc = "Float Files",
            },
            {
                "<C-g>",
                function()
                    close_side_panels()
                    vim.cmd("Neotree float git_status toggle reveal")
                end,
                desc = "Float Git Status",
            },
            {
                "<C-e>",
                function()
                    close_side_panels()
                    vim.cmd("Neotree float buffers toggle reveal")
                end,
                desc = "Float Buffer Tree",
            },
        }
    end,
    --- https://github.com/nvim-neo-tree/neo-tree.nvim/blob/v3.x/lua/neo-tree/defaults.lua
    opts = function()
        local icons = require("vin.icons")
        return {
            default_component_configs = {
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
            },
            add_blank_line_at_top = true,
            hide_root_node = true,
            sources = {
                "filesystem",
                "buffers",
                "git_status",
                "document_symbols",
            },
            nesting_rules = {
                ["package.json"] = {
                    pattern = "^package%.json$", -- <-- Lua pattern
                    files = { "package-lock.json", "yarn*" }, -- <-- glob pattern
                },
                ["go"] = {
                    pattern = "(.*)%.go$", -- <-- Lua pattern with capture
                    files = { "%1_test.go" }, -- <-- glob pattern with capture
                },
                ["ts"] = { "spec.ts" },
            },
            filesystem = {
                hijack_netrw_behavior = "disabled",
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
                        ".gitignored",
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

            window = { -- see https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/popup for
                position = "left",
                width = 40,
                popup = {
                    size = {
                        height = 20,
                        width = 40,
                    },
                    position = "50%", -- 50% means center it
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
                    ["C"] = function(state)
                        local node = state.tree:get_node()
                        local filename_without_ext = node.name:gsub("%..*", "")
                        lib.component.find_and_open_component_file(filename_without_ext)
                    end,
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
