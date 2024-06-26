local M = {}

---@type LazyPluginSpec
M.spec = {
    "stevearc/conform.nvim",
    ---@module "conform"
    event = { "BufReadPre", "BufNewFile" },
    cmd = { "ConformInfo" },
    init = function()
        vim.g.vin_autoformat_enabled = true
    end,
    ---@type conform.setupOpts
    opts = {
        format_on_save = function()
            if vim.g.vin_autoformat_enabled then
                return { timeout_ms = 500, lsp_fallback = true }
            end
        end,
        formatters_by_ft = {
            css = { { "prettierd", "prettier" } },
            scss = { { "prettierd", "prettier" } },
            graphql = { { "prettierd", "prettier" } },
            html = { { "prettierd", "prettier" } },
            javascript = { { "prettierd", "prettier" } },
            javascriptreact = { { "prettierd", "prettier" } },
            json = { { "prettierd", "prettier" } },
            lua = { "stylua" },
            markdown = { { "prettierd", "prettier" } },
            svelte = { { "prettierd", "prettier" } },
            typescript = { { "prettierd", "prettier" } },
            typescriptreact = { { "prettierd", "prettier" } },
            yaml = { "prettierd", "prettier" },
            toml = { "taplo" },
            go = { "gofmt" },
            sh = { "shfmt" },
            c = { "clang-format" },
        },
    },
    keys = {
        {
            "<leader>cf",
            function()
                require("conform").format({
                    async = false,
                    timeout_ms = 500,
                    lsp_fallback = true,
                })
            end,
            desc = "[F]ormat",
        },
        {
            "<leader>cF",
            function()
                if vim.g.vin_autoformat_enabled then
                    vim.g.vin_autoformat_enabled = false
                else
                    vim.g.vin_autoformat_enabled = true
                end

                if vim.g.vin_autoformat_enabled then
                    vim.notify("Autoformat enabled", vim.log.levels.INFO, { title = "Conform" })
                else
                    vim.notify("Autoformat disabled", vim.log.levels.INFO, { title = "Conform" })
                end
            end,
            desc = "[F]ormat (Toggle)",
        },
        {
            "<leader>vf",
            "<cmd>ConformInfo<CR>",
            desc = "[F]ormat Info",
        },
    },
}

return M.spec
