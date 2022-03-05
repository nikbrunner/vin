local Functions = {}

-- Function to toggle quickfix list
vim.cmd([[
function! ToggleQuickFix()
  if empty(filter(getwininfo(), 'v:val.quickfix'))
    copen
  else
    cclose
  endif
endfunction
]])

function _G.put(...)
	local objects = {}
	for i = 1, select("#", ...) do
		local v = select(i, ...)
		table.insert(objects, vim.inspect(v))
	end

	print(table.concat(objects, "\n"))
	return ...
end

-- get the current filename without extension
Functions.get_current_filename = function()
	local fileNameWithExt = vim.fn.expand("%:t")
	local dotIndex = string.find(fileNameWithExt, ".", 1, true)
	local fileName = string.sub(fileNameWithExt, 1, dotIndex - 1)
	return fileName
end

return Functions
