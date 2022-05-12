-- Function to savely load modules when sourcing the the init.lua
local function load(mod)
  package.loaded[mod] = nil
  return require(mod)
end

load("vin.core")
load("vin.plugins")
load("vin.configs")
load("vin.lsp")
load("vin.keybindings")
