---@type LazySpec
local spec = {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    opts = function()
        local is_dot_mode_enabled = Vin.config.dot_mode

        local Dot = Vin.icons.ui.Dot
        local LineMiddle = Vin.icons.ui.LineMiddle
        local Triangle = Vin.icons.ui.Triangle

        local general_char = is_dot_mode_enabled and Dot or LineMiddle
        local deleted_char = is_dot_mode_enabled and Dot or Triangle

        return {
            signs = {
                add = { text = general_char },
                change = { text = general_char },
                delete = { text = deleted_char },
                topdelete = { text = deleted_char },
                changedelete = { text = general_char },
                untracked = { text = general_char },
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
        }
    end,
}

return spec
