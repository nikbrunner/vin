local Utils = {
  bind = {},
  other = {
    printMessage = function( message )
      print( message )
    end
  }
}

function Utils.bind.bindCommand( plug, cmd )
  return "<cmd>" .. plug .. " " .. cmd .. "<CR>"
end

function Utils.bind.telescope( cmd )
  return Utils.bind.bindCommand( "Telescope", cmd )
end

function Utils.bind.lspsaga( cmd )
  return Utils.bind.bindCommand( "Lspsaga", cmd )
end

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

return Utils
