local base_pathes = {
    repos = vim.fn.expand("~/repos"),
    config_home = vim.fn.expand("$XDG_CONFIG_HOME"),
}

---@class VinConfig
local config = {
    colorscheme = "black-atom-operations",
    ---@type "dark" | "light"
    background = "dark",
    ---see for wezterm themes: https://wezfurlong.org/wezterm/colorschemes/index.html
    colors_config_map = {
        ["terra-spring-night"] = { wezterm = "Black Atom - Terra Spring Night" },
        ["terra-spring-day"] = { wezterm = "Google Light (Gogh)" },
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
        ["quiet"] = {
            wezterm = "Google Light (Gogh)",
            enable_custom_highlights = true,
        },
        ["habamax"] = {
            wezterm = "Google Dark (Gogh)",
            enable_custom_highlights = true,
        },
    },
    open_neotree_on_startup = false,
    ---For every colorscheme I set, I want some consistency in the in the highlights.
    ---See also: vin/lib/highlights#set_custom_highlights
    custom_highlights = {
        enable = false,
        ---If true, the contrast between floating windows and the background will be increased.-
        ---@type boolean
        enable_contrast = true,
        ---A higher value means lower contrast between the two backgrounds.
        ---@type number A float number between (0 & 1).
        contrast_factor = 0.9,
    },
    pathes = {
        repos = base_pathes.repos,
        config = {
            vin = base_pathes.config_home .. "/nvim/lua/vin/config.lua",
            wezterm = base_pathes.config_home .. "/wezterm/wezterm.lua",
        },
        notes = {
            personal = base_pathes.repos .. "/nikbrunner/notes",
            work = { dcd = base_pathes.repos .. "/nikbrunner/dcd-notes" },
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

return config
