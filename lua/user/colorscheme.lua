require("github-theme").setup({
	theme_style = "dark_default",
	hide_end_of_buffer = true,
	dark_sidebar = true,
	function_style = "italic",
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
