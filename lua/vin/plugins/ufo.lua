local M = {}

function M.fold_virt_text_handler(virtText, lnum, endLnum, width, truncate)
    local newVirtText = {}
    local suffix = ("  %d "):format(endLnum - lnum)
    local sufWidth = vim.fn.strdisplaywidth(suffix)
    local targetWidth = width - sufWidth
    local curWidth = 0
    for _, chunk in ipairs(virtText) do
        local chunkText = chunk[1]
        local chunkWidth = vim.fn.strdisplaywidth(chunkText)
        if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
        else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            local hlGroup = chunk[2]
            table.insert(newVirtText, { chunkText, hlGroup })
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            -- str width returned from truncate() may less than 2nd argument, need padding
            if curWidth + chunkWidth < targetWidth then
                suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
            end
            break
        end
        curWidth = curWidth + chunkWidth
    end
    table.insert(newVirtText, { suffix, "MoreMsg" })
    return newVirtText
end

---@type LazySpec
local spec = {
    "kevinhwang91/nvim-ufo",
    dependencies = {
        "kevinhwang91/promise-async",
        {
            "luukvbaal/statuscol.nvim",
            config = function()
                local builtin = require("statuscol.builtin")
                require("statuscol").setup({
                    relculright = true,
                    segments = {
                        { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
                        { text = { "%s" }, click = "v:lua.ScSa" },
                        { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
                    },
                })
            end,
        },
    },
    enabled = true,
    event = "BufRead",
    keys = {
        {
            "zR",
            function()
                require("ufo").openAllFolds()
            end,
            "Open all Folds (Ufo)",
        },
        {
            "zM",
            function()
                require("ufo").closeAllFolds()
            end,
            "Close all Folds (Ufo)",
        },
        {
            "zm",
            function()
                require("ufo").closeFoldsWith()
            end,
            "Close Folds With (Ufo)",
        },
        {
            "zp",
            function()
                local winid = require("ufo").peekFoldedLinesUnderCursor()
                if not winid then
                    vim.lsp.buf.hover()
                end
            end,
            "Preview Fold (Ufo)",
        },
    },
    config = function(_, opts)
        vim.o.foldcolumn = "1"
        vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
        vim.o.foldlevelstart = 99
        vim.o.foldenable = true
        vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

        require("ufo").setup({
            provider_selector = function(bufnr, filetype, buftype)
                return { "treesitter", "indent" }
            end,
            fold_virt_text_handler = M.fold_virt_text_handler,
            preview = {
                win_config = {
                    border = "rounded",
                    winblend = 5,
                    winhighlight = "Normal:NvimTreeNormal",
                    maxheight = 20,
                },
                mappings = {
                    scrollB = "",
                    scrollF = "",
                    scrollU = "<C-u>",
                    scrollD = "<C-d>",
                    scrollE = "",
                    scrollY = "",
                    close = "q",
                    switch = "<Tab>",
                    trace = "<C-y>",
                },
            },
        })
    end,
}

return spec
