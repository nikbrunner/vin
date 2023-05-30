---@type LazySpec
local spec = {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    opts = function()
        local is_dot_mode_enabled = Vin.config.dot_mode

        local DotIcon = Vin.icons.ui.BigDot

        local AddIcon = is_dot_mode_enabled and DotIcon or Vin.icons.git.LineAdded
        local ModifiedIcon = is_dot_mode_enabled and DotIcon
            or Vin.icons.git.LineModified
        local DeletedIcon = is_dot_mode_enabled and DotIcon
            or Vin.icons.git.LineRemoved
            or Vin.icons.git.LineRemoved
        local UntrackedIcon = is_dot_mode_enabled and DotIcon
            or Vin.icons.git.FileUntracked

        return {
            signs = {
                add = { text = AddIcon },
                change = { text = ModifiedIcon },
                delete = { text = DeletedIcon },
                topdelete = { text = DeletedIcon },
                changedelete = { text = ModifiedIcon },
                untracked = { text = UntrackedIcon },
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
