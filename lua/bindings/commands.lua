local Commands = {}

local bindCommand = function(plug, cmd, areCommandsSeperatedWithSpace, args)
  if (areCommandsSeperatedWithSpace) then
    if (cmd == nil) then
      return "<cmd>" .. plug .. "<CR>"
    elseif (args == nil) then
      return "<cmd>" .. plug .. " " .. cmd .. "<CR>"
    else
      return "<cmd>" .. plug .. " " .. cmd .. " " .. args .. "<CR>"
    end
  else
    if (cmd == nil) then
      return "<cmd>" .. plug .. "<CR>"
    elseif (args == nil) then
      return "<cmd>" .. plug .. cmd .. "<CR>"
    else
      return "<cmd>" .. plug .. cmd .. " " .. args .. "<CR>"
    end
  end
end

function Commands.telescope(cmd)
  return bindCommand("Telescope", cmd, true)
end

function Commands.lspsaga(cmd)
  return bindCommand("Lspsaga", cmd, true)
end

function Commands.dashboard(cmd)
  return bindCommand("Dashboard", cmd, false)
end

function Commands.packer(cmd)
  return bindCommand("Packer", cmd, false)
end

function Commands.nvimTree(cmd)
  return bindCommand("NvimTree", cmd, false)
end

function Commands.lspInstall(cmd)
  return bindCommand("LspInstall", cmd, false)
end

function Commands.lspTrouble(cmd)
  return bindCommand("LspTrouble", cmd, false)
end

function Commands.todo(cmd)
  return bindCommand("Todo", cmd, false)
end

function Commands.buffer(cmd)
  return bindCommand("Buffer", cmd, false)
end

function Commands.gitsigns(cmd)
  return bindCommand("Gitsigns", cmd, true)
end

function Commands.lazyGit(cmd)
  return bindCommand("LazyGit", cmd, false)
end

function Commands.vimLsp(cmd)
  -- TODO I dont lik this
  return bindCommand("lua vim.lsp.buf.", cmd, false)
end

Commands.copy = {
  fullPath = function()
    return ":let @+ = expand('%:p')<CR>"
  end,
  relativePath = function()
    return ":let @+ = expand('%')<CR>"
  end,
  fileName = function()
    return ":let @+ = expand('%:t')<CR>"
  end
}

-- Function to toggle quickfix list
vim.cmd [[
function! ToggleQuickFix()
  if empty(filter(getwininfo(), 'v:val.quickfix'))
    copen
  else
    cclose
  endif
endfunction
]]

return Commands
