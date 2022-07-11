local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
	return
end

vim.opt.list = true
-- vim.opt.listchars:append("space:⋅")
-- vim.opt.listchars:append("eol:↴")

indent_blankline.setup({
	buftype_exclude = { "terminal", "nofile" },
	filetype_exclude = {
		"help",
		"startify",
		"dashboard",
		"packer",
		"neogitstatus",
		"NvimTree",
		"neo-tree",
		"Trouble",
	},
	char = "│",
	-- char = "┃",
	-- char = "·",
	show_end_of_line = false,
	show_current_context = true,
	space_char_blankline = " ",
	show_trailing_blankline_indent = false,
	show_first_indent_level = true,
	use_treesitter = true,
	char_highlight_list = {
		"IndentBlanklineIndent1",
		"IndentBlanklineIndent2",
		"IndentBlanklineIndent3",
		"IndentBlanklineIndent4",
		"IndentBlanklineIndent5",
		"IndentBlanklineIndent6",
		"IndentBlanklineIndent7",
		"IndentBlanklineIndent8",
		"IndentBlanklineIndent9",
	},
	context_patterns = {
		"class",
		"return",
		"function",
		"method",
		"^if",
		"^while",
		"jsx_element",
		"^for",
		"^object",
		"^table",
		"block",
		"arguments",
		"if_statement",
		"else_clause",
		"jsx_element",
		"jsx_self_closing_element",
		"try_statement",
		"catch_clause",
		"import_statement",
		"operation_type",
	},
})
