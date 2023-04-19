---@type LazySpec
local spec = {
    "luukvbaal/statuscol.nvim",
    event = "BufRead",
    enabled = true,
    opts = function()
        local builtin = require("statuscol.builtin")
        return {
            setopt = true, -- Whether to set the 'statuscolumn' option, may be set to false for those who
            relculright = true, -- whether to right-align the cursor line number with 'relativenumber' set
            segments = {
                {
                    text = { builtin.foldfunc, " " },
                    click = "v:lua.ScFa",
                    hl = "FoldColumn",
                },
                {
                    text = { "%s" },
                    hl = "SignColumn",
                    click = "v:lua.ScSa",
                },
                {
                    text = {
                        builtin.lnumfunc,
                        " ",
                    },
                    hl = "SignColumn",
                    click = "v:lua.ScLa",
                },
            },
        }
    end,
    config = function(_, opts)
        local statuscol = require("statuscol")
        statuscol.setup(opts)
    end,
}

return spec
