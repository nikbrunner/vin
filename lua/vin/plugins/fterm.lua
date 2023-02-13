return {
    "numToStr/FTerm.nvim",
    opts = {
        border = "single",
        dimensions = {
            height = 0.9,
            width = 0.9,
        },

        ---@type string
        hl = "NormalFloat",
    },
    config = function(_, opts)
        local fterm = require("FTerm")
        fterm.setup(opts)
    end,
}
