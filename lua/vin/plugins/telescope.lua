return {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    version = false, -- telescope did only one release, so use HEAD for now
    dependencies = {
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            dependencies = "nvim-telescope/telescope.nvim",
            event = "VeryLazy",
        },
        {
            "nvim-telescope/telescope-github.nvim",
            dependencies = "nvim-telescope/telescope.nvim",
            event = "VeryLazy",
        },
    },
    init = function()
        local telescope = require("telescope")

        telescope.load_extension("todo-comments")
        telescope.load_extension("noice")
    end,
    opts = function()
        local actions = require("telescope.actions")

        local merge = Vin.lib.utils.merge

        local quick_vertical_window = {
            show_line = false,
            layout_strategy = "vertical",
            layout_config = {
                width = 0.75,
                height = 0.75,
            },
            initial_mode = "normal",
        }

        local no_preview = {
            previewer = false,
            prompt_title = false,
        }

        return {
            defaults = {
                prompt_prefix = " " .. Vin.icons.ui.Telescope .. " ",
                selection_caret = " " .. Vin.icons.ui.ArrowClosed .. " ",
                entry_prefix = "  ",
                path_display = { "truncate" },
                initial_mode = "insert",
                selection_strategy = "reset",
                sorting_strategy = "descending",
                layout_strategy = "flex",
                layout_config = {
                    horizontal = {
                        height = 0.9,
                        preview_cutoff = 0,
                        prompt_position = "bottom",
                        width = 0.8,
                        preview_width = 0.65,
                    },
                    vertical = {
                        height = 0.95,
                        preview_height = 0.5,
                        preview_cutoff = 0,
                        prompt_position = "bottom",
                        width = 0.8,
                    },
                    bottom_pane = {
                        height = 25,
                        preview_cutoff = 0,
                        prompt_position = "top",
                    },
                    center = {
                        height = 0.4,
                        preview_cutoff = 0,
                        prompt_position = "top",
                        width = 0.5,
                    },
                    cursor = {
                        height = 0.9,
                        preview_cutoff = 40,
                        width = 0.8,
                    },
                    width = 0.65,
                    height = 0.65,
                    preview_cutoff = 10,
                },

                borderchars = {
                    "─",
                    "│",
                    "─",
                    "│",
                    "╭",
                    "╮",
                    "╯",
                    "╰",
                },

                mappings = {
                    i = {
                        ["<C-h>"] = actions.cycle_history_next,
                        ["<C-l>"] = actions.cycle_history_prev,

                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,

                        ["<C-c>"] = actions.close,

                        ["<Down>"] = actions.move_selection_next,
                        ["<Up>"] = actions.move_selection_previous,

                        ["<CR>"] = actions.select_default,
                        ["<C-x>"] = actions.select_horizontal,
                        ["<C-v>"] = actions.select_vertical,
                        ["<C-t>"] = actions.select_tab,

                        ["<C-u>"] = actions.preview_scrolling_up,
                        ["<C-d>"] = actions.preview_scrolling_down,

                        ["<PageUp>"] = actions.results_scrolling_up,
                        ["<PageDown>"] = actions.results_scrolling_down,

                        ["<Tab>"] = actions.toggle_selection
                            + actions.move_selection_worse,
                        ["<S-Tab>"] = actions.toggle_selection
                            + actions.move_selection_better,
                        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                        ["<M-q>"] = actions.send_selected_to_qflist
                            + actions.open_qflist,
                        ["<C-l>"] = actions.complete_tag,
                        ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
                    },

                    n = {
                        ["<esc>"] = actions.close,
                        ["<CR>"] = actions.select_default,
                        ["<C-x>"] = actions.select_horizontal,
                        ["<C-v>"] = actions.select_vertical,
                        ["<C-t>"] = actions.select_tab,

                        ["<Tab>"] = actions.toggle_selection
                            + actions.move_selection_worse,
                        ["<S-Tab>"] = actions.toggle_selection
                            + actions.move_selection_better,
                        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                        ["<M-q>"] = actions.send_selected_to_qflist
                            + actions.open_qflist,

                        ["j"] = actions.move_selection_next,
                        ["k"] = actions.move_selection_previous,
                        ["H"] = actions.move_to_top,
                        ["M"] = actions.move_to_middle,
                        ["L"] = actions.move_to_bottom,

                        ["<Down>"] = actions.move_selection_next,
                        ["<Up>"] = actions.move_selection_previous,
                        ["gg"] = actions.move_to_top,
                        ["G"] = actions.move_to_bottom,

                        ["<C-u>"] = actions.preview_scrolling_up,
                        ["<C-d>"] = actions.preview_scrolling_down,

                        ["<PageUp>"] = actions.results_scrolling_up,
                        ["<PageDown>"] = actions.results_scrolling_down,

                        ["?"] = actions.which_key,
                    },
                },
            },
            pickers = {
                find_files = {
                    hidden = true,
                    file_ignore_patterns = { "^.git/", "^node_modules/" },
                },
                lsp_definitions = quick_vertical_window,
                lsp_references = quick_vertical_window,
                lsp_implementations = quick_vertical_window,
                lsp_type_definitions = quick_vertical_window,
                buffers = quick_vertical_window,
                current_buffer_fuzzy_find = {
                    theme = "ivy",
                },
                spell_suggest = {
                    theme = "cursor",
                },
                colorscheme = {
                    theme = "dropdown",
                    enable_preview = true,
                },
                oldfiles = merge({
                    theme = "dropdown",
                    no_preview,
                }),
                commands = {
                    theme = "ivy",
                },
            },
            extensions = {
                project = {
                    base_dirs = {
                        { "~/Documents/dev/repos", max_depth = 4 },
                    },
                    hidden_files = false,
                    theme = "dropdown",
                    display_type = "minimal",
                    sync_with_nvim_tree = true, -- default false
                },
                fzf = {
                    fuzzy = true, -- false will only do exact matching
                    override_generic_sorter = true, -- override the generic sorter
                    override_file_sorter = true, -- override the file sorter
                    case_mode = "smart_case", -- or "ignore_case" or "respect_case" the default case_mode is "smart_case"
                },
            },
        }
    end,
}
