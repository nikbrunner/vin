---@class VinConfig
local config = {
    ---@type TerraConfig.ColorSchemeName
    colorscheme = "terra_fall_night",
    ---@type TerraConfig.Transparency
    transparency = "partial",
    pathes = {
        notes = {
            personal = vim.fn.expand("~") .. "/Documents/notes/notes",
            work = {
                dcd = vim.fn.expand("~") .. "/Documents/notes/dcd-notes",
            },
        },
    },
    branch_notes = {
        mappings = {
            toggle_note = "<C-b>",
            toggle_checkbox = "<C-k>",
        },
    },
    ensure_installed = {
        -- :h mason-lspconfig-server-map
        servers = {
            "astro",
            "bashls",
            "cssls",
            "gopls",
            "html",
            "jsonls",
            "lua_ls",
            "marksman",
            "rust_analyzer",
            "tsserver",
        },
        -- :h mason-tool-installer
        tools = {
            "stylua",
            "luacheck",
            "shellcheck",
            "prettierd",
            "black",
        },
    },
}

return config
