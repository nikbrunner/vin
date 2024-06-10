local M = {}

---@type LazyPluginSpec
M.spec = {
    "tris203/precognition.nvim",
    event = "VeryLazy",
    opts = {
        -- startVisible = true,
        -- showBlankVirtLine = true,
        -- highlightColor = { link = "Comment" },
        hints = {
            Caret = { text = "^", prio = 2 },
            Dollar = { text = "$", prio = 1 },
            MatchingPair = { text = "%", prio = 5 },
            Zero = { text = "0", prio = 1 },
            w = { text = "w", prio = 10 },
            b = { text = "b", prio = 9 },
            e = { text = "e", prio = 8 },
            W = { text = "W", prio = 7 },
            B = { text = "B", prio = 6 },
            E = { text = "E", prio = 5 },
        },
        -- TODO: Gutter doesn't work. Probably an issue with `statuscol.nvim`
        gutterHints = {
            G = { text = "G", prio = 10 },
            gg = { text = "gg", prio = 9 },
            PrevParagraph = { text = "{", prio = 8 },
            NextParagraph = { text = "}", prio = 8 },
        },
    },
    keys = {
        {
            "<leader>un",
            function()
                require("precognition").toggle()
            end,
            desc = "[N]avigation Hints",
        },
    },
}

return M.spec
