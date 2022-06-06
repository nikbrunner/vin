-- Functions to copy path and filenames

Vin.cmd.copy = {}

Vin.cmd.copy.fullPath = function()
	return ":let @+ = expand('%:p')<CR>"
end

Vin.cmd.copy.relativePath = function()
	return ":let @+ = expand('%')<CR>"
end

Vin.cmd.copy.fileName = function()
	return ":let @+ = expand('%:t')<CR>"
end
