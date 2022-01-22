local Functions = {}

-- Function to copy path and filenames
Functions.copy = {
	fullPath = function()
		return ":let @+ = expand('%:p')<CR>"
	end,
	relativePath = function()
		return ":let @+ = expand('%')<CR>"
	end,
	fileName = function()
		return ":let @+ = expand('%:t')<CR>"
	end,
}

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

return Functions
