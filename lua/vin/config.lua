local base_pathes = {
    repos = vim.fn.expand("~/repos"),
    config_home = vim.fn.expand("$XDG_CONFIG_HOME"),
}

---@class VinConfig
local config = {
    colorscheme = "black-atom-medical",
    ---@type "dark" | "light"
    background = "light",
    ---see for wezterm themes: https://wezfurlong.org/wezterm/colorschemes/index.html
    colors_config_map = {
        ["terra-spring-night"] = {
            wezterm = "Gruvbox Material (Gogh)",
            enable_custom_highlights = false,
        },
        ["terra-spring-day"] = {
            wezterm = "Google Light (Gogh)",
            enable_custom_highlights = false,
        },
        ["terra-summer-night"] = {
            wezterm = "Ayu Mirage",
            enable_custom_highlights = false,
        },
        ["terra-summer-day"] = {
            wezterm = "Google Light (Gogh)",
            enable_custom_highlights = false,
        },
        ["terra-fall-night"] = {
            wezterm = "Gruvbox Material (Gogh)",
            enable_custom_highlights = false,
        },
        ["terra-winter-night"] = {
            wezterm = "nord",
            enable_custom_highlights = false,
        },
        ["black-atom-engineering"] = {
            wezterm = "Tokyo Night Moon",
            enable_custom_highlights = false,
        },
        ["black-atom-operations"] = {
            wezterm = "Tokyo Night Moon",
            enable_custom_highlights = false,
        },
        ["black-atom-research"] = {
            wezterm = "catppuccin-latte",
            enable_custom_highlights = false,
        },
        ["black-atom-medical"] = {
            wezterm = "catppuccin-latte",
            enable_custom_highlights = false,
        },
        ["catppuccin"] = {
            wezterm = "catppuccin",
            enable_custom_highlights = true,
        },
        ["catppuccin-mocha"] = {
            wezterm = "catppuccin-mocha",
            enable_custom_highlights = true,
        },
        ["catppuccin-frappe"] = {
            wezterm = "catppuccin-frappe",
            enable_custom_highlights = true,
        },
        ["catppuccin-machiato"] = {
            wezterm = "catppuccin-machiato",
            enable_custom_highlights = true,
        },
        ["catppuccin-latte"] = {
            wezterm = "catppuccin-latte",
            enable_custom_highlights = true,
        },
        ["quiet"] = {
            wezterm = "Google Light (Gogh)",
            enable_custom_highlights = true,
        },
        ["habamax"] = {
            wezterm = "Google Dark (Gogh)",
            enable_custom_highlights = true,
        },
        ["github_dark_default"] = {
            wezterm = "GitHub Dark",
            enable_custom_highlights = false,
        },
        ["github_light_default"] = {
            wezterm = "Google Light (Gogh)",
            enable_custom_highlights = false,
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
