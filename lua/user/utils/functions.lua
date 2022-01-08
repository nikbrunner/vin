local Commands = {}

-- Function to copy path and filenames
Commands.copy = {
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

return Commands
