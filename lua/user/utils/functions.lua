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

Functions.map = function(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

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

-- TODO I did not get this to work
-- Functions.toggle_qf = function()
-- 	local qf_open = false
-- 	for _, win in pairs(vim.fn.getwininfo()) do
-- 		if win["quickfix"] == 1 then
-- 			qf_open = true
-- 		end
-- 	end
-- 	if qf_open == true then
-- 		vim.cmd("cclose")
-- 		return
-- 	end
-- 	if not vim.tbl_isempty(vim.fn.getqflist()) then
-- 		vim.cmd("copen")
-- 	end
-- end

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
