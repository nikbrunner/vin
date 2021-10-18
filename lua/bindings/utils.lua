local Utils = {}

-- INFO These are currently unused but I want to keep them for now
function Utils.createRemap(from, to)
  local obj = {}
  obj.from = from
  obj.to = to
  return obj
end

function Utils.setNvimKeyMap(mode, mapTable, options)
  for _, value in pairs(mapTable) do
    vim.api.nvim_set_keymap(mode, value.to, value.from, options)
  end
end

return Utils
