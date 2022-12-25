local _, gitsigns = pcall(require, "gitsigns")

local diffview_notification = function(message)
    vim.notify(message)
end

-- TODO: Move diffview in here?

vin.cmds.git = {}

vin.cmds.git.open_changes_in_qf = function()
    gitsigns.setqflist()
end

vin.cmds.git.action = function()
    -- INFO: Must be enabled via `null-ls`: https://github.com/lewis6991/gitsigns.nvim#null-ls
    vim.lsp.buf.code_action()
    vin.lib.center_line_vertical()
end

vin.cmds.git.hunk_preview = function()
    gitsigns.preview_hunk()
    vin.lib.center_line_vertical()
end

vin.cmds.git.toggle_current_line_blame = function()
    gitsigns.toggle_current_line_blame()
    diffview_notification("Toggled Current Line Blame")
end

vin.cmds.git.blame_line = function()
    gitsigns.blame_line()
    vin.lib.center_line_vertical()
end

vin.cmds.git.hunk_reset = function()
    gitsigns.reset_hunk()
    vin.lib.center_line_vertical()
end

vin.cmds.git.hunk_go_prev = function()
    gitsigns.prev_hunk()
    vin.lib.center_line_vertical()
    -- vin.cmds.git.hunk_preview()
end

vin.cmds.git.hunk_go_next = function()
    gitsigns.next_hunk()
    vin.lib.center_line_vertical()
    -- vin.cmds.git.hunk_preview()
end

vin.cmds.git.hunk_stage = function()
    gitsigns.stage_hunk()
end

vin.cmds.git.hunk_undo_stage = function()
    gitsigns.undo_stage_hunk()
end

vin.cmds.git.buffer_stage = function()
    gitsigns.stage_buffer()
end

vin.cmds.git.buffer_reset = function()
    gitsigns.reset_buffer()
end
