local gitsigns_ok, gitsigns = pcall(require, "gitsigns")
if not gitsigns_ok then
    return
end

local diffview_notification = function(message)
    vim.notify(message)
end

-- TODO: Move diffview in here?

Vin.cmds.git = {}

Vin.cmds.git.open_changes_in_qf = function()
    gitsigns.setqflist()
end

Vin.cmds.git.action = function()
    -- INFO: Must be enabled via `null-ls`: https://github.com/lewis6991/gitsigns.nvim#null-ls
    vim.lsp.buf.code_action()
    Vin.lib.center_line_vertical()
end

Vin.cmds.git.hunk_preview = function()
    gitsigns.preview_hunk()
    Vin.lib.center_line_vertical()
end

Vin.cmds.git.toggle_current_line_blame = function()
    gitsigns.toggle_current_line_blame()
    diffview_notification("Toggled Current Line Blame")
end

Vin.cmds.git.blame_line = function()
    gitsigns.blame_line()
    Vin.lib.center_line_vertical()
end

Vin.cmds.git.hunk_reset = function()
    gitsigns.reset_hunk()
    Vin.lib.center_line_vertical()
end

Vin.cmds.git.hunk_go_prev = function()
    gitsigns.prev_hunk()
    Vin.lib.center_line_vertical()
    -- Vin.cmds.git.hunk_preview()
end

Vin.cmds.git.hunk_go_next = function()
    gitsigns.next_hunk()
    Vin.lib.center_line_vertical()
    -- Vin.cmds.git.hunk_preview()
end

Vin.cmds.git.hunk_stage = function()
    gitsigns.stage_hunk()
end

Vin.cmds.git.hunk_undo_stage = function()
    gitsigns.undo_stage_hunk()
end

Vin.cmds.git.buffer_stage = function()
    gitsigns.stage_buffer()
end

Vin.cmds.git.buffer_reset = function()
    gitsigns.reset_buffer()
end
