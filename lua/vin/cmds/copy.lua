-- Functions to copy path and filenames
local function copy(path)
    vim.fn.setreg("+", path)
    vim.notify('Copied "' .. path .. '" to the clipboard!')
end

local M = {}

M.fullPath = function()
    copy(vim.fn.expand("%:p"))
end

M.relativePath = function()
    -- Source: https://www.reddit.com/r/neovim/comments/q2s3t1/how_to_get_current_filename_relative_to_project/
    copy(vim.fn.fnamemodify(vim.fn.expand("%"), ":p:~:."))
end

M.fileName = function()
    copy(vim.fn.expand("%:t"))
end

return M
