return {
    "dmmulroy/ts-error-translator.nvim",
    event = "LspAttach",
    config = function()
        require("ts-error-translator").setup()
    end,
}
