-- Functions to copy path and filenames
local function copy(path)
    vim.fn.setreg("+", path)
    vim.notify('Copied "' .. path .. '" to the clipboard!')
end

local M = {}

M.fullPath = function()
    local full_path = vim.fn.expand("%:p")
    copy(full_path)
end

M.relativePath = function()
    -- Source: https://www.reddit.com/r/neovim/comments/q2s3t1/how_to_get_current_filename_relative_to_project/
    local relative_path = vim.fn.fnamemodify(vim.fn.expand("%"), ":p:~:.")
    copy(relative_path)
end

M.fileName = function()
    local file_name = vim.fn.expand("%:t")
    copy(file_name)
end

return M
