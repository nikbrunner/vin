local status_ok, github_theme = pcall(require, "github-theme")
if not status_ok then
	return
end

github_theme.setup({
	theme_style = "dark_default",
	hide_end_of_buffer = true,
  hide_inactive_statusline = false,
  dark_float = true,
	dark_sidebar = true,
	function_style = "bold",
	keyword_style = "bold",
	variable_style = "bold",
	comment_style = "italic",
	sidebars = { "qf", "vista_kind", "terminal", "packer", "lazygit", "whichkey" },
})
