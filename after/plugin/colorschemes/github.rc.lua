local present, github_theme = pcall(require, "github-theme")
if not present then
    return
end

local current_theme = Vin.colorscheme.theme

if current_theme == "github_dark_default" or current_theme == "github_dimmed" then
    local theme_style = "dark_default" -- Default

    if current_theme == "github_dark_default" then
        theme_style = "dark_default"
    elseif current_theme == "github_dimmed" then
        theme_style = "dimmed"
    end

    github_theme.setup({
        theme_style = theme_style,
        hide_end_of_buffer = true,
        hide_inactive_statusline = false,
        transparent = false,
        dark_float = true,
        dark_sidebar = true,
        function_style = "bold",
        keyword_style = "bold",
        variable_style = "bold",
        comment_style = "italic",
        sidebars = {
            "qf",
            "neo-tree",
            "NeoTree",
            "neo_tree",
            "vista_kind",
            "terminal",
            "packer",
            "lazygit",
            "whichkey",
            "telescope",
        },

        -- Overwrite the highlight groups
        overrides = function(colors)
            return {
                TSTagAttribute = {
                    bg = colors.bright_blue,
                },
                TSVariable = {
                    fg = colors.bright_blue,
                },
                Folded = {
                    fg = colors.syntax.comment,
                    style = "italic",
                },
            }
        end,
    })

    -- These are unused atm, but I want to keep them for reference
    ---@diagnostic disable-next-line: unused-local
    local github_dark_default_colors = {
        black = "#484f58",
        white = "#b1bac4",
        red = "#ff7b72",
        green = "#3fb950",
        blue = "#58a6ff",
        yellow = "#d29922",
        cyan = "#39c5cf",
        magenta = "#bc8cff",

        black_light = "#6e7681",
        white_light = "#f0f6fc",
        red_light = "#ffa198",
        yellow_light = "#e3b341",
        blue_light = "#517f8d",
        magenta_light = "#d2a8ff",
        green_light = "#56d364",
        cyan_light = "#56d4dd",

        NormalFg = "#b3b1ad",
        NormalBg = "#0d1117",
        InactiveFg = "#4d5566",
        InactiveBg = "#0d1117",
        ActiveFg = "#090c10",
        ActiveBg = "#58a6ff",

        TabSelectionBg = "#58a6ff",
        TabSelectionFg = "#090c10",
    }
end
