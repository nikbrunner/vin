local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local hide_in_narrow_panes = function()
	return vim.fn.winwidth(0) > 80
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn", "info", "hint" },
	colored = true,
	update_in_insert = false,
	always_visible = true,
	cond = hide_in_narrow_panes,
}

local diff = {
	"diff",
	colored = true,
	symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
	cond = hide_in_narrow_panes,
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
	cond = hide_in_narrow_panes,
}

local time = {
	'os.date("%a %H:%M %x")',
	cond = hide_in_narrow_panes,
}

local tabs = {
	"tabs",
	cond = hide_in_narrow_panes,
}

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "github",
		section_separators = { left = "", right = "" },
		component_separators = { left = "", right = "" },
		disabled_filetypes = { "alpha", "dashboard", "Outline", "NvimTree" },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { mode },
		lualine_b = { branch },
		lualine_c = { diagnostics },
		lualine_x = { diff },
		lualine_y = { filetype, filename },
		lualine_z = { time, tabs },
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

-- Auto Command for clock
vim.cmd([[
  au BufEnter,BufWinEnter,WinEnter,CmdwinEnter * if bufname('%') == "NvimTree" | set laststatus=0 | else | set laststatus=2 | endif
]])

-- Trigger rerender of status line every second for clock
if _G.Statusline_timer == nil then
	_G.Statusline_timer = vim.loop.new_timer()
else
	_G.Statusline_timer:stop()
end
_G.Statusline_timer:start(
	0,
	1000,
	vim.schedule_wrap(function()
		vim.api.nvim_command("redrawstatus")
	end)
)
