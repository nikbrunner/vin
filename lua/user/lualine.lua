local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn", "info", "hint" },
	colored = true,
	update_in_insert = false,
	always_visible = true,
	cond = hide_in_width,
}

local diff = {
	"diff",
	colored = true,
	symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
	cond = hide_in_width,
}

local mode = {
	"mode",
	icon = " ",
}

local filetype = {
	"filetype",
	colored = true,
	icon_only = true,
	padding = { left = 1, right = 0 },
	component_separators = { right = "" },
}

local filename = {
	"filename",
	padding = { left = 1, right = 1 },
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
	cond = hide_in_width,
}

local tabs = {
	"tabs",
	cond = hide_in_width,
}

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "github",
		section_separators = { left = "", right = "" },
		component_separators = { left = "", right = "" },
		disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { mode },
		lualine_b = { branch },
		lualine_c = { diagnostics },
		lualine_x = { diff },
		lualine_y = { filetype, filename },
		lualine_z = { tabs },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = { diff },
		lualine_y = { filetype, filename },
		lualine_z = { tabs },
	},
	tabline = {},
	extensions = {},
})
