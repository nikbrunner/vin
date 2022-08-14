-- Functions to copy path and filenames

Vin.cmds.copy = {}

Vin.cmds.copy.fullPath = function()
    return ":let @+ = expand('%:p')<CR>"
end

Vin.cmds.copy.relativePath = function()
    return ":let @+ = expand('%')<CR>"
end

Vin.cmds.copy.fileName = function()
    return ":let @+ = expand('%:t')<CR>"
end
