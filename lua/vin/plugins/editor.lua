return {
    {
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
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        event = "BufReadPost",
        opts = {
            -- char = "▏",
            char = "│",
            filetype_exclude = {
                "help",
                "alpha",
                "dashboard",
                "neo-tree",
                "Trouble",
                "lazy",
            },
            show_trailing_blankline_indent = false,
            show_current_context = false,
        },
    },

    {
        "echasnovski/mini.indentscope",
        version = false, -- wait till new 0.7.0 release to put it back on semver
        event = "BufReadPre",
        opts = {
            -- symbol = "▏",
            symbol = "│",
            options = { try_as_border = true },
        },
        config = function(_, opts)
            vim.api.nvim_create_autocmd("FileType", {
                pattern = {
                    "help",
                    "alpha",
                    "dashboard",
                    "neo-tree",
                    "Trouble",
                    "lazy",
                    "mason",
                },
                callback = function()
                    vim.b.miniindentscope_disable = true
                end,
            })
            require("mini.indentscope").setup(opts)
        end,
    },

    {
        "lewis6991/gitsigns.nvim",
        event = "BufReadPre",
        opts = {
            signs = {
                add = { text = "▎" },
                change = { text = "▎" },
                delete = { text = "契" },
                topdelete = { text = "契" },
                changedelete = { text = "▎" },
                untracked = { text = "▎" },
            },
            signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
            numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
            linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
            word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
            watch_gitdir = {
                interval = 1000,
                follow_files = true,
            },
            attach_to_untracked = true,
            current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
            current_line_blame_opts = {
                virt_text = true,
                virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
                delay = 125,
                ignore_whitespace = false,
            },
            current_line_blame_formatter_opts = {
                relative_time = true,
            },
            sign_priority = 6,
            update_debounce = 100,
            status_formatter = nil, -- Use default
            max_file_length = 40000,
            preview_config = {
                -- Options passed to nvim_open_win
                border = "single",
                style = "minimal",
                relative = "cursor",
                row = 0,
                col = 1,
            },
        },
    },

    {
        "folke/todo-comments.nvim",
        cmd = { "TodoTrouble", "TodoTelescope" },
        dependencies = "nvim-lua/plenary.nvim",
        event = "BufReadPost",
        keys = {
            -- TODO: Put in Groups
            { "<leader>xt", "<cmd>TodoTrouble<cr>", desc = "Todo (Trouble)" },
            {
                "<leader>xT",
                "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>",
                desc = "Todo/Fix/Fixme (Trouble)",
            },
            { "<leader>st", "<cmd>TodoTelescope<cr>", desc = "Todo" },
        },
        opts = {
            signs = true, -- show icons in the signs column
            sign_priority = 8, -- sign priority
            -- keywords recognized as todo comments
            keywords = {
                FIX = {
                    icon = " ", -- icon used for the sign, and in search results
                    color = "error", -- can be a hex color, or a named color (see below)
                    alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
                    -- signs = false, -- configure signs for some keywords individually
                },
                TODO = { icon = " ", color = "info" },
                HACK = { icon = " ", color = "warning" },
                WARN = {
                    icon = " ",
                    color = "warning",
                    alt = { "WARNING", "XXX" },
                },
                PERF = {
                    icon = " ",
                    alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" },
                },
                NOTE = {
                    icon = " ",
                    color = "hint",
                    alt = { "INFO", "DOCS", "QUESTION" },
                },
                QUESTION = { icon = "?", color = "hint" },
            },
            merge_keywords = true, -- when true, custom keywords will be merged with the defaults
            -- highlighting of the line containing the todo comment
            -- * before: highlights before the keyword (typically comment characters)
            -- * keyword: highlights of the keyword
            -- * after: highlights after the keyword (todo text)
            highlight = {
                before = "", -- "fg" or "bg" or empty
                keyword = "fg", -- "fg", "bg", "wide" or empty. (wide is the same as bg, but will also highlight surrounding characters)
                after = "", -- "fg" or "bg" or empty
                pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlightng (vim regex)
                comments_only = true, -- uses treesitter to match keywords in comments only
                max_line_len = 400, -- ignore lines longer than this
                exclude = {}, -- list of file types to exclude highlighting
            },
            -- list of named colors where we try to extract the guifg from the
            -- list of hilight groups or use the hex color if hl not found as a fallback
            colors = {
                error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
                warning = { "DiagnosticWarning", "WarningMsg", "#FBBF24" },
                info = { "DiagnosticInfo", "#2563EB" },
                hint = { "DiagnosticHint", "#10B981" },
                default = { "Identifier", "#7C3AED" },
            },
            search = {
                command = "rg",
                args = {
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                },
                -- regex that will be used to match keywords.
                -- don't replace the (KEYWORDS) placeholder
                pattern = [[\b(KEYWORDS):]], -- ripgrep regex
                -- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
            },
        },
    },

    {
        "folke/trouble.nvim",
        cmd = { "TroubleToggle", "Trouble" },
        event = "VeryLazy",
        opts = {
            position = "bottom", -- position of the list can be: bottom, top, left, right
            height = 15, -- height of the trouble list when position is top or bottom
            width = 100, -- width of the list when position is left or right
            icons = true, -- use devicons for filenames
            mode = "workspace_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
            fold_open = "", -- icon used for open folds
            fold_closed = "", -- icon used for closed folds
            group = true, -- group results by file
            padding = true, -- add an extra new line on top of the list
            action_keys = { -- key mappings for actions in the trouble list
                -- map to {} to remove a mapping, for example:
                -- close = {},
                close = "q", -- close the list
                cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
                refresh = "r", -- manually refresh
                jump = { "<cr>", "<tab>" }, -- jump to the diagnostic or open / close folds
                open_split = { "<c-x>" }, -- open buffer in new split
                open_vsplit = { "<c-v>" }, -- open buffer in new vsplit
                open_tab = { "<c-t>" }, -- open buffer in new tab
                jump_close = { "o" }, -- jump to the diagnostic and close the list
                toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
                toggle_preview = "P", -- toggle auto_preview
                hover = "K", -- opens a small popup with the full multiline message
                preview = "p", -- preview the diagnostic location
                close_folds = { "zM", "zm" }, -- close all folds
                open_folds = { "zR", "zr" }, -- open all folds
                toggle_fold = { "zA", "za" }, -- toggle fold of current file
                previous = "k", -- preview item
                next = "j", -- next item
            },
            use_diagnostic_signs = true, -- enabling this will use the signs defined in your lsp client
        },
    },

    {
        -- TODO: Replace with mini.comment?
        "numToStr/Comment.nvim",
        event = "VeryLazy",
    },

    {
        "ThePrimeagen/harpoon",
        event = "VeryLazy",
        opts = {
            menu = { width = 125, height = 10 },

            -- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
            save_on_toggle = true,

            -- saves the harpoon file upon every change. disabling is unrecommended.
            save_on_change = true,

            -- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
            enter_on_sendcmd = false,

            -- closes any tmux windows harpoon that harpoon creates when you close Neovim.
            tmux_autoclose_windows = false,

            -- filetypes that you want to prevent from adding to the harpoon list menu.
            excluded_filetypes = { "harpoon" },
        },
    },

    {
        "sindrets/diffview.nvim",
        event = "VeryLazy",
        dependencies = "nvim-lua/plenary.nvim",
        opts = function()
            local actions = require("diffview.actions")

            return {
                diff_binaries = false, -- Show diffs for binaries
                enhanced_diff_hl = false, -- See |diffview-config-enhanced_diff_hl|
                git_cmd = { "git" }, -- The git executable followed by default args.
                use_icons = true, -- Requires nvim-web-devicons
                show_help_hints = true, -- Show hints for how to open the help panel
                watch_index = true, -- Update views and index buffers when the git index changes.
                icons = { -- Only applies when use_icons is true.
                    folder_closed = "",
                    folder_open = "",
                },
                signs = {
                    fold_closed = "",
                    fold_open = "",
                    done = "✓",
                },
                view = {
                    -- Configure the layout and behavior of different types of views.
                    -- Available layouts:
                    --  'diff1_plain'
                    --    |'diff2_horizontal'
                    --    |'diff2_vertical'
                    --    |'diff3_horizontal'
                    --    |'diff3_vertical'
                    --    |'diff3_mixed'
                    --    |'diff4_mixed'
                    -- For more info, see |diffview-config-view.x.layout|.
                    default = {
                        -- Config for changed files, and staged files in diff views.
                        layout = "diff2_horizontal",
                    },
                    merge_tool = {
                        -- Config for conflicted files in diff views during a merge or rebase.
                        layout = "diff3_horizontal",
                        disable_diagnostics = true, -- Temporarily disable diagnostics for conflict buffers while in the view.
                    },
                    file_history = {
                        -- Config for changed files in file history views.
                        layout = "diff2_horizontal",
                    },
                },
                file_panel = {
                    listing_style = "tree", -- One of 'list' or 'tree'
                    tree_options = { -- Only applies when listing_style is 'tree'
                        flatten_dirs = true, -- Flatten dirs that only contain one single dir
                        folder_statuses = "only_folded", -- One of 'never', 'only_folded' or 'always'.
                    },
                    win_config = { -- See |diffview-config-win_config|
                        position = "left",
                        width = 35,
                        win_opts = {},
                    },
                },
                file_history_panel = {
                    log_options = { -- See |diffview-config-log_options|
                        git = {
                            single_file = {
                                diff_merges = "combined",
                            },
                            multi_file = {
                                diff_merges = "first-parent",
                            },
                        },
                        hg = {
                            single_file = {},
                            multi_file = {},
                        },
                    },
                    win_config = { -- See |diffview-config-win_config|
                        position = "bottom",
                        height = 16,
                        win_opts = {},
                    },
                },
                commit_log_panel = {
                    win_config = {}, -- See |diffview-config-win_config|
                },
                default_args = { -- Default args prepended to the arg-list for the listed commands
                    DiffviewOpen = {},
                    DiffviewFileHistory = {},
                },
                hooks = {}, -- See |diffview-config-hooks|
                keymaps = {
                    disable_defaults = false, -- Disable the default keymaps
                    view = {
                        -- The `view` bindings are active in the diff buffers, only when the current
                        -- tabpage is a Diffview.
                        {
                            "n",
                            "<tab>",
                            actions.select_next_entry,
                            { desc = "Open the diff for the next file" },
                        },
                        {
                            "n",
                            "<s-tab>",
                            actions.select_prev_entry,
                            { desc = "Open the diff for the previous file" },
                        },
                        {
                            "n",
                            "gf",
                            actions.goto_file,
                            {
                                desc = "Open the file in a new split in the previous tabpage",
                            },
                        },
                        {
                            "n",
                            "<C-w><C-f>",
                            actions.goto_file_split,
                            { desc = "Open the file in a new split" },
                        },
                        {
                            "n",
                            "<C-w>gf",
                            actions.goto_file_tab,
                            { desc = "Open the file in a new tabpage" },
                        },
                        {
                            "n",
                            "<leader>e",
                            actions.focus_files,
                            { desc = "Bring focus to the file panel" },
                        },
                        {
                            "n",
                            "<leader>b",
                            actions.toggle_files,
                            { desc = "Toggle the file panel." },
                        },
                        {
                            "n",
                            "g<C-x>",
                            actions.cycle_layout,
                            { desc = "Cycle through available layouts." },
                        },
                        {
                            "n",
                            "[x",
                            actions.prev_conflict,
                            {
                                desc = "In the merge-tool: jump to the previous conflict",
                            },
                        },
                        {
                            "n",
                            "]x",
                            actions.next_conflict,
                            {
                                desc = "In the merge-tool: jump to the next conflict",
                            },
                        },
                        {
                            "n",
                            "<leader>co",
                            actions.conflict_choose("ours"),
                            { desc = "Choose the OURS version of a conflict" },
                        },
                        {
                            "n",
                            "<leader>ct",
                            actions.conflict_choose("theirs"),
                            { desc = "Choose the THEIRS version of a conflict" },
                        },
                        {
                            "n",
                            "<leader>cb",
                            actions.conflict_choose("base"),
                            { desc = "Choose the BASE version of a conflict" },
                        },
                        {
                            "n",
                            "<leader>ca",
                            actions.conflict_choose("all"),
                            { desc = "Choose all the versions of a conflict" },
                        },
                        {
                            "n",
                            "dx",
                            actions.conflict_choose("none"),
                            { desc = "Delete the conflict region" },
                        },
                    },
                    diff1 = {
                        -- Mappings in single window diff layouts
                        {
                            "n",
                            "g?",
                            actions.help({ "view", "diff1" }),
                            { desc = "Open the help panel" },
                        },
                    },
                    diff2 = {
                        -- Mappings in 2-way diff layouts
                        {
                            "n",
                            "g?",
                            actions.help({ "view", "diff2" }),
                            { desc = "Open the help panel" },
                        },
                    },
                    diff3 = {
                        -- Mappings in 3-way diff layouts
                        {
                            { "n", "x" },
                            "2do",
                            actions.diffget("ours"),
                            {
                                desc = "Obtain the diff hunk from the OURS version of the file",
                            },
                        },
                        {
                            { "n", "x" },
                            "3do",
                            actions.diffget("theirs"),
                            {
                                desc = "Obtain the diff hunk from the THEIRS version of the file",
                            },
                        },
                        {
                            "n",
                            "g?",
                            actions.help({ "view", "diff3" }),
                            { desc = "Open the help panel" },
                        },
                    },
                    diff4 = {
                        -- Mappings in 4-way diff layouts
                        {
                            { "n", "x" },
                            "1do",
                            actions.diffget("base"),
                            {
                                desc = "Obtain the diff hunk from the BASE version of the file",
                            },
                        },
                        {
                            { "n", "x" },
                            "2do",
                            actions.diffget("ours"),
                            {
                                desc = "Obtain the diff hunk from the OURS version of the file",
                            },
                        },
                        {
                            { "n", "x" },
                            "3do",
                            actions.diffget("theirs"),
                            {
                                desc = "Obtain the diff hunk from the THEIRS version of the file",
                            },
                        },
                        {
                            "n",
                            "g?",
                            actions.help({ "view", "diff4" }),
                            { desc = "Open the help panel" },
                        },
                    },
                    file_panel = {
                        {
                            "n",
                            "j",
                            actions.next_entry,
                            { desc = "Bring the cursor to the next file entry" },
                        },
                        {
                            "n",
                            "<down>",
                            actions.next_entry,
                            { desc = "Bring the cursor to the next file entry" },
                        },
                        {
                            "n",
                            "k",
                            actions.prev_entry,
                            {
                                desc = "Bring the cursor to the previous file entry.",
                            },
                        },
                        {
                            "n",
                            "<up>",
                            actions.prev_entry,
                            {
                                desc = "Bring the cursor to the previous file entry.",
                            },
                        },
                        {
                            "n",
                            "<cr>",
                            actions.select_entry,
                            { desc = "Open the diff for the selected entry." },
                        },
                        {
                            "n",
                            "o",
                            actions.select_entry,
                            { desc = "Open the diff for the selected entry." },
                        },
                        {
                            "n",
                            "<2-LeftMouse>",
                            actions.select_entry,
                            { desc = "Open the diff for the selected entry." },
                        },
                        {
                            "n",
                            "-",
                            actions.toggle_stage_entry,
                            { desc = "Stage / unstage the selected entry." },
                        },
                        {
                            "n",
                            "S",
                            actions.stage_all,
                            { desc = "Stage all entries." },
                        },
                        {
                            "n",
                            "U",
                            actions.unstage_all,
                            { desc = "Unstage all entries." },
                        },
                        {
                            "n",
                            "X",
                            actions.restore_entry,
                            {
                                desc = "Restore entry to the state on the left side.",
                            },
                        },
                        {
                            "n",
                            "L",
                            actions.open_commit_log,
                            { desc = "Open the commit log panel." },
                        },
                        {
                            "n",
                            "<c-b>",
                            actions.scroll_view(-0.25),
                            { desc = "Scroll the view up" },
                        },
                        {
                            "n",
                            "<c-f>",
                            actions.scroll_view(0.25),
                            { desc = "Scroll the view down" },
                        },
                        {
                            "n",
                            "<tab>",
                            actions.select_next_entry,
                            { desc = "Open the diff for the next file" },
                        },
                        {
                            "n",
                            "<s-tab>",
                            actions.select_prev_entry,
                            { desc = "Open the diff for the previous file" },
                        },
                        {
                            "n",
                            "gf",
                            actions.goto_file,
                            {
                                desc = "Open the file in a new split in the previous tabpage",
                            },
                        },
                        {
                            "n",
                            "<C-w><C-f>",
                            actions.goto_file_split,
                            { desc = "Open the file in a new split" },
                        },
                        {
                            "n",
                            "<C-w>gf",
                            actions.goto_file_tab,
                            { desc = "Open the file in a new tabpage" },
                        },
                        {
                            "n",
                            "i",
                            actions.listing_style,
                            { desc = "Toggle between 'list' and 'tree' views" },
                        },
                        {
                            "n",
                            "f",
                            actions.toggle_flatten_dirs,
                            {
                                desc = "Flatten empty subdirectories in tree listing style.",
                            },
                        },
                        {
                            "n",
                            "R",
                            actions.refresh_files,
                            { desc = "Update stats and entries in the file list." },
                        },
                        {
                            "n",
                            "<leader>e",
                            actions.focus_files,
                            { desc = "Bring focus to the file panel" },
                        },
                        {
                            "n",
                            "<leader>b",
                            actions.toggle_files,
                            { desc = "Toggle the file panel" },
                        },
                        {
                            "n",
                            "g<C-x>",
                            actions.cycle_layout,
                            { desc = "Cycle available layouts" },
                        },
                        {
                            "n",
                            "[x",
                            actions.prev_conflict,
                            { desc = "Go to the previous conflict" },
                        },
                        {
                            "n",
                            "]x",
                            actions.next_conflict,
                            { desc = "Go to the next conflict" },
                        },
                        {
                            "n",
                            "g?",
                            actions.help("file_panel"),
                            { desc = "Open the help panel" },
                        },
                    },
                    file_history_panel = {
                        {
                            "n",
                            "g!",
                            actions.options,
                            { desc = "Open the option panel" },
                        },
                        {
                            "n",
                            "<C-A-d>",
                            actions.open_in_diffview,
                            {
                                desc = "Open the entry under the cursor in a diffview",
                            },
                        },
                        {
                            "n",
                            "y",
                            actions.copy_hash,
                            {
                                desc = "Copy the commit hash of the entry under the cursor",
                            },
                        },
                        {
                            "n",
                            "L",
                            actions.open_commit_log,
                            { desc = "Show commit details" },
                        },
                        {
                            "n",
                            "zR",
                            actions.open_all_folds,
                            { desc = "Expand all folds" },
                        },
                        {
                            "n",
                            "zM",
                            actions.close_all_folds,
                            { desc = "Collapse all folds" },
                        },
                        {
                            "n",
                            "j",
                            actions.next_entry,
                            { desc = "Bring the cursor to the next file entry" },
                        },
                        {
                            "n",
                            "<down>",
                            actions.next_entry,
                            { desc = "Bring the cursor to the next file entry" },
                        },
                        {
                            "n",
                            "k",
                            actions.prev_entry,
                            {
                                desc = "Bring the cursor to the previous file entry.",
                            },
                        },
                        {
                            "n",
                            "<up>",
                            actions.prev_entry,
                            {
                                desc = "Bring the cursor to the previous file entry.",
                            },
                        },
                        {
                            "n",
                            "<cr>",
                            actions.select_entry,
                            { desc = "Open the diff for the selected entry." },
                        },
                        {
                            "n",
                            "o",
                            actions.select_entry,
                            { desc = "Open the diff for the selected entry." },
                        },
                        {
                            "n",
                            "<2-LeftMouse>",
                            actions.select_entry,
                            { desc = "Open the diff for the selected entry." },
                        },
                        {
                            "n",
                            "<c-b>",
                            actions.scroll_view(-0.25),
                            { desc = "Scroll the view up" },
                        },
                        {
                            "n",
                            "<c-f>",
                            actions.scroll_view(0.25),
                            { desc = "Scroll the view down" },
                        },
                        {
                            "n",
                            "<tab>",
                            actions.select_next_entry,
                            { desc = "Open the diff for the next file" },
                        },
                        {
                            "n",
                            "<s-tab>",
                            actions.select_prev_entry,
                            { desc = "Open the diff for the previous file" },
                        },
                        {
                            "n",
                            "gf",
                            actions.goto_file,
                            {
                                desc = "Open the file in a new split in the previous tabpage",
                            },
                        },
                        {
                            "n",
                            "<C-w><C-f>",
                            actions.goto_file_split,
                            { desc = "Open the file in a new split" },
                        },
                        {
                            "n",
                            "<C-w>gf",
                            actions.goto_file_tab,
                            { desc = "Open the file in a new tabpage" },
                        },
                        {
                            "n",
                            "<leader>e",
                            actions.focus_files,
                            { desc = "Bring focus to the file panel" },
                        },
                        {
                            "n",
                            "<leader>b",
                            actions.toggle_files,
                            { desc = "Toggle the file panel" },
                        },
                        {
                            "n",
                            "g<C-x>",
                            actions.cycle_layout,
                            { desc = "Cycle available layouts" },
                        },
                        {
                            "n",
                            "g?",
                            actions.help("file_history_panel"),
                            { desc = "Open the help panel" },
                        },
                    },
                    option_panel = {
                        {
                            "n",
                            "<tab>",
                            actions.select_entry,
                            { desc = "Change the current option" },
                        },
                        {
                            "n",
                            "q",
                            actions.close,
                            { desc = "Close the panel" },
                        },
                        {
                            "n",
                            "g?",
                            actions.help("option_panel"),
                            { desc = "Open the help panel" },
                        },
                    },
                    help_panel = {
                        { "n", "q", actions.close, { desc = "Close help menu" } },
                        {
                            "n",
                            "<esc>",
                            actions.close,
                            { desc = "Close help menu" },
                        },
                    },
                },
            }
        end,
        config = function(_, opts)
            local diffview = require("diffview")
            diffview.setup(opts)
        end,
    },
}
