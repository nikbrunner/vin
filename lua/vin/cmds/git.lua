local _, gitsigns = pcall(require, "gitsigns")

vin.cmds.git = {}

vin.cmds.git.open_changes_in_qf = function()
    gitsigns.setqflist()
end

vin.cmds.git.hunk_preview = function()
    gitsigns.preview_hunk()
end

vin.cmds.git.toggle_current_line_blame = function()
    gitsigns.toggle_current_line_blame()
    vim.notify("Toggled Current Line Blame")
end

vin.cmds.git.blame_line = function()
    gitsigns.blame_line()
    vin.cmds.general.center_line_vertical()
end

vin.cmds.git.hunk_reset = function()
    gitsigns.reset_hunk()
    vin.cmds.general.center_line_vertical()
end

vin.cmds.git.hunk_go_prev = function()
    gitsigns.prev_hunk()
    vin.cmds.general.center_line_vertical()
end

vin.cmds.git.hunk_go_next = function()
    gitsigns.next_hunk()
    vin.cmds.general.center_line_vertical()
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
