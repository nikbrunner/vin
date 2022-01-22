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
	sidebars = { "qf", "vista_kind", "terminal", "packer", "lazygit" },
})

vim.cmd([[
try
  colorscheme github_dark_default
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]])

-- Hide statusline
vim.cmd([[
  hi StatusLine gui=NONE guifg=NONE guibg=NonText guisp=NonText
  hi StatusLineNc gui=NONE guifg=NONE guibg=NonText guisp=NonText
]])
