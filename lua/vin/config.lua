local base_pathes = {
    repos = vim.fn.expand("~/repos/"),
    config_home = vim.fn.expand("$XDG_CONFIG_HOME"),
}

---@class VinConfig
local config = {
    colorscheme = "quiet",
    ---@type "dark" | "light"
    background = "light",
    ---See for Wezterm themes: https://wezfurlong.org/wezterm/colorschemes/index.html
    colors_config_map = {
        ["terra_spring_night"] = {
            wezterm = "Everforest Dark (Gogh)",
            enable_custom_highlights = false,
        },
        ["terra_summer_night"] = {
            wezterm = "Ayu Mirage",
            enable_custom_highlights = false,
        },
        ["terra_fall_night"] = {
            wezterm = "Gruvbox Material (Gogh)",
            enable_custom_highlights = false,
        },
        ["terra_winter_night"] = {
            wezterm = "nord",
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
    },
    ---For every colorscheme I set, I want some consistency in the in the highlights.
    ---See also: vin/lib/highlights#set_custom_highlights
    custom_highlights = {
        enable = true,
        ---If true, the contrast between floating windows and the background will be increased.-
        ---@type boolean
        enable_contrast = true,
        ---A higher value means lower contrast between the two backgrounds.
        ---@type number A float number between (0 & 1).
        contrast_factor = 0.95,
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
