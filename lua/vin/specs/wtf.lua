local M = {}

---@type LazyPluginSpec
M.spec = {
    "piersolenski/wtf.nvim",
    dependencies = {
        "MunifTanjim/nui.nvim",
    },
    event = "VeryLazy",
    opts = {
        popup_type = "vertical",
        openai_model_id = "gpt-4",
        search_engine = "google",
    },
    keys = {
        {
            "iw",
            function()
                require("wtf").ai()
            end,
            desc = "Debug diagnostic with AI",
        },
        {
            "iW",
            function()
                require("wtf").search()
            end,
            desc = "Search diagnostic with Google",
        },
    },
}

return M.spec
