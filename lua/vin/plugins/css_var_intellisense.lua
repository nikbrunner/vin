---@LazySpec
local spec = {
    dir = "~/Documents/dev/repos/css-var-intellisense",
    enabled = false,
    config = function()
        require("css_var_intellisense").setup()
    end,
}

return spec
