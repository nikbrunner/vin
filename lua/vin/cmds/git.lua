local general = require("vin.cmds.general")
local utils = require("vin.lib.utils")
local gitsigns = require("gitsigns")

local M = {}

M.open_changes_in_qf = function()
    gitsigns.setqflist()
end

M.hunk_preview = function()
    gitsigns.preview_hunk()
end

M.toggle_current_line_blame = function()
    gitsigns.toggle_current_line_blame()
    vim.notify("Toggled Current Line Blame")
end

M.blame_line = function()
    gitsigns.blame_line()
    general.center_line_vertical()
end

M.hunk_reset = function()
    gitsigns.reset_hunk()
    general.center_line_vertical()
end

M.hunk_go_prev = function()
    gitsigns.prev_hunk()
    general.center_line_vertical()
end

M.hunk_go_next = function()
    gitsigns.next_hunk()
    general.center_line_vertical()
end

M.hunk_stage = function()
    gitsigns.stage_hunk()
end

M.hunk_undo_stage = function()
    gitsigns.undo_stage_hunk()
end

M.buffer_stage = function()
    gitsigns.stage_buffer()
end

M.buffer_reset = function()
    gitsigns.reset_buffer()
end

return M
