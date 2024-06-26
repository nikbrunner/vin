local M = {}

---@class VinConfig
M.config = {
    colorscheme = "black-atom-operations",
    ---@type "dark" | "light"
    background = "dark",
    ---see for wezterm themes: https://wezfurlong.org/wezterm/colorschemes/index.html
    colorscheme_config_map = {
        ["default"] = { wezterm = "neovim" },
        ["terra-spring-night"] = { wezterm = "Black Atom - Terra Spring Night" },
        ["terra-spring-day"] = { wezterm = "Black Atom - Terra Spring Day" },
        ["terra-summer-night"] = { wezterm = "Black Atom - Terra Summer Night" },
        ["terra-summer-day"] = { wezterm = "Google Light (Gogh)" },
        ["terra-fall-night"] = { wezterm = "Black Atom - Terra Fall Night" },
        ["terra-winter-night"] = { wezterm = "Black Atom - Terra Winter Night" },
        ["black-atom-engineering"] = { wezterm = "Black Atom - Engineering" },
        ["black-atom-operations"] = { wezterm = "Black Atom - Operations" },
        ["black-atom-medical"] = { wezterm = "Black Atom - Medical" },
        ["black-atom-research"] = { wezterm = "Black Atom - Research" },
        ["github_dark_default"] = { wezterm = "GitHub Dark" },
        ["github_light_default"] = { wezterm = "Google Light (Gogh)" },
        ["catppuccin"] = { wezterm = "catppuccin" },
        ["catppuccin-mocha"] = { wezterm = "catppuccin-mocha" },
        ["catppuccin-frappe"] = { wezterm = "catppuccin-frappe" },
        ["catppuccin-machiato"] = { wezterm = "catppuccin-machiato" },
        ["catppuccin-latte"] = { wezterm = "catppuccin-latte" },
    },
    open_previous_files_on_startup = false,
    open_neotree_on_startup = false,
    pathes = {
        repos = vim.fn.expand("~/repos"),
        config = {
            vin = vim.fn.expand("$XDG_CONFIG_HOME") .. "/nvim/lua/vin/config.lua",
            wezterm = vim.fn.expand("$XDG_CONFIG_HOME") .. "/wezterm/wezterm.lua",
        },
        notes = {
            personal = vim.fn.expand("~/repos") .. "/nikbrunner/notes",
            work = {
                dcd = vim.fn.expand("~/repos") .. "/nikbrunner/dcd-notes",
            },
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
            "yamlls",
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
            "yamllint",
            "shfmt",
        },
    },
}

return M.config
