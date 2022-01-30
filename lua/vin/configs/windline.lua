local status_ok, windline = pcall(require, "windline")
if not status_ok then
	return
end

local helper = require("windline.helpers")
local b_components = require("windline.components.basic")

---@diagnostic disable-next-line: undefined-field
local state = _G.WindLine.state

local lsp_comps = require("windline.components.lsp")
local git_comps = require("windline.components.git")

local hl_list = {
	Black = { "NormalFg", "NormalBg" },
	White = { "NormalBg", "NormalFg" },
	Inactive = { "InactiveFg", "InactiveBg" },
	Active = { "ActiveFg", "ActiveBg" },
}
local basic = {}

local breakpoint_width = 90
basic.divider = { b_components.divider, "" }
basic.bg = { " ", "NormalBg" }

local colors_mode = {
	Normal = { "blue", "NormalBg" },
	Insert = { "green", "NormalBg" },
	Visual = { "yellow", "NormalBg" },
	Replace = { "blue_light", "NormalBg" },
	Command = { "magenta", "NormalBg" },
}

basic.vi_mode = {
	name = "vi_mode",
	hl_colors = colors_mode,
	text = function()
		return { { " " .. state.mode[1] .. " ", state.mode[2] } }
	end,
}

basic.square_mode = {
	hl_colors = colors_mode,
	text = function()
		return { { "▊", state.mode[2] } }
	end,
}

basic.lsp_diagnos = {
	name = "diagnostic",
	hl_colors = {
		red = { "red", "NormalBg" },
		yellow = { "yellow", "NormalBg" },
		blue = { "blue", "NormalBg" },
	},
	width = breakpoint_width,
	text = function(bufnr)
		if lsp_comps.check_lsp(bufnr) then
			return {
				{
					lsp_comps.lsp_error({ format = "  %s", show_zero = true }),
					"red",
				},
				{
					lsp_comps.lsp_warning({ format = "  %s", show_zero = true }),
					"yellow",
				},
				{
					lsp_comps.lsp_hint({ format = "  %s", show_zero = true }),
					"blue",
				},
			}
		end
		return ""
	end,
}

local icon_comp = b_components.cache_file_icon({
	default = "",
	hl_colors = { "white", "NormalBg" },
})

basic.file = {
	name = "file",
	hl_colors = {
		default = hl_list.Black,
		white = { "white", "NormalBg" },
		magenta = { "magenta", "NormalBg" },
	},
	text = function(bufnr, _, width)
		if width > breakpoint_width then
			return {
				icon_comp(bufnr),
				{ " ", "" },
				{ b_components.cache_file_name("[No Name]", "unique"), "magenta" },
				{ b_components.line_col_lua, "white" },
				{ b_components.progress_lua, "" },
				{ " ", "" },
				{ b_components.file_modified(" "), "magenta" },
			}
		else
			return {
				{ b_components.cache_file_name("[No Name]", "unique"), "magenta" },
				{ " ", "" },
				{ b_components.file_modified(" "), "magenta" },
			}
		end
	end,
}
basic.git = {
	name = "git",
	hl_colors = {
		green = { "green", "NormalBg" },
		red = { "red", "NormalBg" },
		blue = { "blue", "NormalBg" },
	},
	width = breakpoint_width,
	text = function(bufnr)
		if git_comps.is_git(bufnr) then
			return {
				{
					git_comps.diff_added({ format = "  %s", show_zero = true }),
					"green",
				},
				{
					git_comps.diff_removed({ format = "  %s", show_zero = true }),
					"red",
				},
				{
					git_comps.diff_changed({ format = "  %s", show_zero = true }),
					"blue",
				},
			}
		end
		return ""
	end,
}

local quickfix = {
	filetypes = { "qf", "Trouble" },
	active = {
		{ "🚦 Quickfix ", { "white", "NormalBg" } },
		-- { helper.separators.slant_right, { "NormalBg", "N" } },
		{
			function()
				return vim.fn.getqflist({ title = 0 }).title
			end,
			{ "cyan", "NormalBg" },
		},
		{ " Total : %L ", { "blue", "NormalBg" } },
		{ helper.separators.slant_right, { "NormalBg", "InactiveBg" } },
		{ " ", { "InactiveFg", "InactiveBg" } },
		basic.divider,
		{ helper.separators.slant_right, { "InactiveBg", "NormalBg" } },
		{ "🧛 ", { "white", "NormalBg" } },
	},

	always_active = true,
	show_last_status = true,
}

local explorer = {
	filetypes = { "fern", "NvimTree", "lir" },
	active = {
		{ "  ", { "black", "blue" } },
		{ helper.separators.slant_right, { "blue", "NormalBg" } },
	},
	always_active = true,
	show_last_status = true,
}

basic.lsp_name = {
	width = breakpoint_width,
	name = "lsp_name",
	hl_colors = {
		magenta = { "magenta", "NormalBg" },
	},
	text = function(bufnr)
		if lsp_comps.check_lsp(bufnr) then
			return {
				{ lsp_comps.lsp_name(), "magenta" },
			}
		end
		return {
			{ b_components.cache_file_type({ icon = true }), "magenta" },
		}
	end,
}

local default = {
	filetypes = { "default" },
	active = {
		basic.square_mode,
		basic.vi_mode,
		basic.file,
		basic.lsp_diagnos,
		basic.divider,
		basic.lsp_name,
		basic.git,
		{ git_comps.git_branch(), { "magenta", "NormalBg" }, breakpoint_width },
		{ " ", hl_list.Black },
		basic.square_mode,
	},
	inactive = {
		{ b_components.full_file_name, hl_list.Inactive },
		basic.file_name_inactive,
		basic.divider,
		basic.divider,
		{ b_components.line_col, hl_list.Inactive },
		{ b_components.progress, hl_list.Inactive },
	},
}

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

windline.setup({
	colors_name = function(colors)
		colors = github_dark_default_colors
		return colors
	end,
	statuslines = {
		default,
		quickfix,
		explorer,
	},
})
