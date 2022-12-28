local M = {}

M.center_line_vertical = function()
    vim.cmd([[norm zz]])
end

M.toggleQuickFix = function()
    local windows = vim.fn.getwininfo()
    local has_quickfix_window = false
    for _, win in pairs(windows) do
        if win.quickfix then
            has_quickfix_window = true
            break
        end
    end
    if has_quickfix_window then
        vim.cmd("cclose")
    else
        vim.cmd("copen")
    end
end

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

return M
