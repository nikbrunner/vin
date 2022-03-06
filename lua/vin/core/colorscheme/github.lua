local status_ok, github_theme = pcall(require, "github-theme")
if not status_ok then
	return
end

github_theme.setup({
	theme_style = "dark_default",
	hide_end_of_buffer = true,
	hide_inactive_statusline = false,
	transparent = false,
	dark_float = true,
	dark_sidebar = true,
	function_style = "bold",
	keyword_style = "bold",
	variable_style = "bold",
	comment_style = "italic",
	sidebars = { "qf", "vista_kind", "terminal", "packer", "lazygit", "whichkey" },
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

