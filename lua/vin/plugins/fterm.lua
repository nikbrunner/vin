return {
    "numToStr/FTerm.nvim",
    opts = {
        border = "single",
        dimensions = {
            height = 0.9,
            width = 0.9,
        },
    },
    config = function(_, opts)
        local fterm = require("FTerm")
        fterm.setup(opts)
    end,
}
