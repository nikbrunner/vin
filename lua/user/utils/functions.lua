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

return Functions
