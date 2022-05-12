-- Functions to copy path and filenames

local M = {}

M.fullPath = function()
	return ":let @+ = expand('%:p')<CR>"
end

M.relativePath = function()
	return ":let @+ = expand('%')<CR>"
end

M.fileName = function()
	return ":let @+ = expand('%:t')<CR>"
end

return M
