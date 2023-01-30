return {
    "nmac427/guess-indent.nvim",
    opts = {
        auto_cmd = true, -- Set to false to disable automatic execution
        filetype_exclude = { -- A list of filetypes for which the auto command gets disabled
            "netrw",
            "tutor",
            "neo-tree",
        },
        buftype_exclude = { -- A list of buffer types for which the auto command gets disabled
            "help",
            "nofile",
            "terminal",
            "prompt",
        },
    },
    config = function(_, opts)
        local guess = require("guess-indent")
        guess.setup(opts)
    end,
}
