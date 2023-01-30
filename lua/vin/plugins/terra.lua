return {
    -- "terra-theme/nvim",
    dir = "~/Documents/dev/repos/personal/terra-theme/nvim",
    lazy = false,
    priority = 1000,
    -- dev = true, -- TODO: Implement Dev Mode
    opts = {
        season = "winter",
    },
    config = function(_, opts)
        local terra = require("terra")
        terra.setup(opts)
    end,
}
