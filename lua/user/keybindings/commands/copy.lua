local Copy = {}

-- Functions to copy path and filenames
Copy.fullPath = function()
	return ":let @+ = expand('%:p')<CR>"
end

Copy.relativePath = function()
	return ":let @+ = expand('%')<CR>"
end

Copy.fileName = function()
	return ":let @+ = expand('%:t')<CR>"
end

return Copy
