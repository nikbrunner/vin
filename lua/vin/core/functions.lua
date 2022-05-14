-- Functions for global and vim functions

-- Vim Function to toggle quickfix list
-- TODO Convert to Lua
vim.cmd([[
function! ToggleQuickFix()
  if empty(filter(getwininfo(), 'v:val.quickfix'))
    copen
  else
    cclose
  endif
endfunction
]])

-- Global Function to debug and print table as lines
-- Can be replaced with vim.pretty_print()
function _G.put(...)
	local objects = {}
	for i = 1, select("#", ...) do
		local v = select(i, ...)
		table.insert(objects, vim.inspect(v))
	end

	print(table.concat(objects, "\n"))
	return ...
end

-- Wrapper Function for pcall() command
-- TODO Try this out with a clean install and see if it works
function _G.protected_require(modname)
	local status_ok, mod = pcall(require, modname)
	if not status_ok then
		return nil
	end
	return mod
end
