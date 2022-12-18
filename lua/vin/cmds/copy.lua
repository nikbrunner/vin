-- Functions to copy path and filenames
local function copy(path)
    vim.fn.setreg("+", path)
    vim.notify('Copied "' .. path .. '" to the clipboard!')
end

vin.cmds.copy = {}

vin.cmds.copy.fullPath = function()
    copy(vim.fn.expand("%:p"))
end

vin.cmds.copy.relativePath = function()
    -- Source: https://www.reddit.com/r/neovim/comments/q2s3t1/how_to_get_current_filename_relative_to_project/
    copy(vim.fn.fnamemodify(vim.fn.expand("%"), ":p:~:."))
end

vin.cmds.copy.fileName = function()
    copy(vim.fn.expand("%:t"))
end
