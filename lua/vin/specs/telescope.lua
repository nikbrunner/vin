local M = {}

function M.builtin(cmd, opts)
    return function()
        require("telescope.builtin")[cmd](opts or {})
    end
end

function M.delta_previewer()
    return require("telescope.previewers").new_termopen_previewer({
        get_command = function(entry)
            if entry.status == "??" or "A " then
                return {
                    "git",
                    "-c",
                    "core.pager=delta",
                    "-c",
                    "delta.side-by-side=true",
                    "diff",
                    entry.value,
                }
            end

            return {
                "git",
                "-c",
                "core.pager=delta",
                "-c",
                "delta.side-by-side=true",
                "diff",
                entry.value .. "^!",
            }
        end,
        teardown = function(self)
            -- Close the terminal buffer (~/.local/share/vin/lazy/telescope.nvim/lua/telescope/previewers/term_previewer.lua)
            self.state.termopen_bufnr = nil
            self.state.termopen_id = nil
        end,
    })
end

function M.git_status()
    if vim.fn.system("git status --porcelain") == "" then
        vim.notify("No changes to commit", vim.log.levels.INFO)
        return
    else
        M.builtin("git_status", {
            previewer = M.delta_previewer(),
        })()
    end
end

-- TODO: Why does the delta_previewer not work here?
function M.git_commits()
    M.builtin("git_commits", {
        previewer = M.delta_previewer(),
    })()
end

M.folder_presets = {
    vin = "~/.config/vin",
    lazyvin = "~/.config/lazyvin",
    config = "~/.config",
    personal_notes = require("vin.config").pathes.notes.personal,
    dcd_notes = require("vin.config").pathes.notes.work.dcd,
}

function M.search_preset_folder()
    local choices = {}

    for key, _ in pairs(M.folder_presets) do
        table.insert(choices, key)
    end

    vim.ui.select(choices, {
        prompt = "Pick a folder: ",
        format_item = function(choice)
            return " " .. choice
        end,
    }, function(choice)
        if choice == nil then
            return
        end

        M.builtin("find_files", {
            cwd = M.folder_presets[choice],
        })()
    end)
end

---@type LazyPluginSpec
M.spec = {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    event = "VeryLazy",
    enabled = true,
    dependencies = {
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            enabled = vim.fn.executable("make") == 1,
        },
    },
    init = function()
        require("telescope").load_extension("fzf")
        require("telescope").load_extension("yank_history")
    end,
    keys = {
        { "<leader>sT", M.builtin("treesitter"), desc = "[T]reesitter" },
        { "<leader>so", M.builtin("vim_options"), desc = "[O]ptions" },
        -- { "<leader>gs", M.git_status, desc = "[S]tatus" },
    },
    opts = function()
        local actions = require("telescope.actions")

        local quick_flex_window = {
            show_line = false,
            layout_strategy = "flex",
            layout_config = {
                width = 0.75,
                height = 0.75,
                preview_cutoff = 1,
                mirror = false,
                -- flip_columns = 150,
            },
        }

        ---@diagnostic disable-next-line: unused-local
        local quick_cursor_window = {
            show_line = false,
            theme = "cursor",
            initial_mode = "insert",
        }

        local open_with_trouble = function(...)
            return require("trouble.providers.telescope").open_with_trouble(...)
        end
        local open_selected_with_trouble = function(...)
            return require("trouble.providers.telescope").open_selected_with_trouble(...)
        end

        return {
            defaults = {
                prompt_prefix = " ",
                selection_caret = " ",
                winblend = 5,
                initial_mode = "insert",
                selection_strategy = "reset",
                sorting_strategy = "descending",
                layout_strategy = "flex",
                flip_columns = 150,
                path_display = { "truncate" },
                layout_config = {
                    horizontal = {
                        height = 0.9,
                        preview_cutoff = 0,
                        prompt_position = "bottom",
                        width = 0.8,
                        preview_width = 0.5,
                    },
                    vertical = {
                        height = 0.95,
                        show_line = false,
                        preview_height = 0.5,
                        preview_cutoff = 0,
                        prompt_position = "bottom",
                        width = 0.8,
                    },
                    bottom_pane = {
                        show_line = false,
                        height = 25,
                        preview_cutoff = 0,
                        prompt_position = "top",
                    },
                    center = {
                        show_line = false,
                        height = 0.4,
                        preview_cutoff = 0,
                        prompt_position = "top",
                        width = 0.5,
                    },
                    cursor = {
                        show_line = false,
                        height = 10,
                        preview_cutoff = 40,
                        width = 35,
                    },
                },
                mappings = {
                    i = {
                        ["<ESC>"] = actions.close,

                        ["<C-l>"] = actions.cycle_history_next,
                        ["<C-h>"] = actions.cycle_history_prev,

                        ["<Down>"] = actions.move_selection_next,
                        ["<Up>"] = actions.move_selection_previous,

                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,

                        ["<CR>"] = actions.select_default,
                        ["<C-x>"] = actions.select_horizontal,
                        ["<C-v>"] = actions.select_vertical,
                        ["<C-t>"] = actions.select_tab,

                        ["<C-u>"] = actions.preview_scrolling_up,
                        ["<C-d>"] = actions.preview_scrolling_down,

                        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist, -- Send either all entries or only selceceted to qflist

                        ["<C-_>"] = actions.which_key,
                    },
                    n = {
                        ["q"] = actions.close,

                        ["<C-h>"] = actions.cycle_history_next,
                        ["<C-l>"] = actions.cycle_history_prev,

                        ["<Down>"] = actions.move_selection_next,
                        ["<Up>"] = actions.move_selection_previous,

                        ["gg"] = actions.move_to_top,
                        ["G"] = actions.move_to_bottom,

                        ["<CR>"] = actions.select_default,
                        ["x"] = actions.select_horizontal,
                        ["v"] = actions.select_vertical,
                        ["t"] = actions.select_tab,

                        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

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
                    show_line = false,
                    theme = "ivy",
                    initial_mode = "insert",
                },
                git_files = {
                    hidden = true,
                    file_ignore_patterns = { "^.git/", "^node_modules/" },
                    show_line = false,
                    theme = "ivy",
                    initial_mode = "insert",
                },
                lsp_definitions = quick_flex_window,
                lsp_references = quick_flex_window,
                lsp_implementations = quick_flex_window,
                lsp_type_definitions = quick_flex_window,
                lsp_document_symbols = quick_flex_window,
                lsp_workspace_symbols = quick_flex_window,
                diagnostics = quick_flex_window,
                git_status = {
                    theme = "ivy",
                },
                current_buffer_fuzzy_find = {
                    theme = "ivy",
                },
                buffers = vim.tbl_extend("keep", quick_flex_window, {
                    initial_mode = "insert",
                }),
                spell_suggest = {
                    theme = "cursor",
                },
                colorscheme = {
                    theme = "dropdown",
                    enable_preview = true,
                },
                oldfiles = {
                    theme = "dropdown",
                    previewer = false,
                },
                commands = {
                    theme = "ivy",
                },
            },
        }
    end,
}

return M.spec
