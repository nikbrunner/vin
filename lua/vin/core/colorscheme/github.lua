local status_ok, github_theme = pcall(require, "github-theme")
if not status_ok then
	return
end

github_theme.setup({
	theme_style = "dark_default",
	hide_end_of_buffer = true,
	dark_sidebar = false,
	function_style = "bold",
	keyword_style = "bold",
	variable_style = "bold",
	sidebars = { "qf", "vista_kind", "terminal", "packer", "lazygit", "whichkey" },
})
