---@type LazySpec
local spec = {
    "mbbill/undotree",
}

vim.cmd("let g:undotree_SplitWidth = " .. Vin.config.sidebar_width)

return spec
