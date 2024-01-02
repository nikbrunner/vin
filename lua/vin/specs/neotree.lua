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
                    vim.cmd("Neotree float buffers toggle reveal")
                end,
                desc = "Float Buffer Tree",
            },
        }
    end,
    opts = {
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
            hijack_netrw_behavior = "open_default",
            filtered_items = {
                hide_dotfiles = false,
                hide_gitignored = true,
                hide_hidden = false, -- only works on Windows for hidden files/directories
            },
        },
        source_selector = {
            winbar = false,
            statusline = false, -- toggle to show selector on statusline
            content_layout = "center",
            tabs_layout = "equal",
            sources = {
                {
                    source = "filesystem",
                    display_name = "Files",
                },
                {
                    source = "git_status",
                    display_name = "Git",
                },
                {
                    source = "buffers",
                    display_name = "Buffers",
                },
            },
        },

        window = { -- see https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/popup for
            -- possible options. These can also be functions that return these options.
            position = "left", -- left, right, top, bottom, float, current
            width = 40, -- applies to left and right positions
            popup = { -- settings that apply to float position only
                size = { height = "25" },
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
                ["<C-s>"] = "open_split",
                ["S"] = "split_with_window_picker",
                ["<C-v>"] = "open_vsplit",
                ["V"] = "vsplit_with_window_picker",
                ["t"] = "open_tabnew",
                ["w"] = "open_with_window_picker",
                ["C"] = function(state)
                    local node = state.tree:get_node()
                    local filename_without_ext = node.name:gsub("%..*", "")
                    require("lib.component").find_and_open_component_file(filename_without_ext)
                end,
                ["O"] = function(state)
                    local node = state.tree:get_node()
                    local path = node:get_id()
                    path = vim.fn.shellescape(path, 1)
                    -- TODO: use `vim.ui.open()` when it's available
                    vim.cmd("!open " .. path)
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
    },
    config = function(_, opts)
        require("neo-tree").setup(opts)
    end,
}

return M.spec
