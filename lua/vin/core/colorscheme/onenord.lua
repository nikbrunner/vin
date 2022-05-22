local status_ok, onenord = pcall(require, "onenord")
if not status_ok then
	return
end

local default_colors = require("onenord.colors").load()

local colors_darker = {
	slate_gray_0 = "#101216",
	slate_gray_1 = "#12151A",
	slate_gray_2 = "#15171D",
	slate_gray_3 = "#171A20",
	slate_gray_4 = "#191D23",
	slate_gray_5 = "#1C1F26",
	slate_gray_6 = "#1E222A",
}

local dark_nord = {
	fg_dark = "#B1BDD3",
	fg = "#e5e9f0",
	fg_light = "#eceff4",
	bg = colors_darker.slate_gray_2,
	gray = "#646A76",
	light_gray = "#6C7A96",
	cyan = "#70a9a1",
	blue = "#81A1C1",
	dark_blue = "#5E81AC",
	green = "#79B791",
	light_green = "#ABD1B5",
	dark_red = "#BF616A",
	red = "#D57780",
	light_red = "#DE878F",
	pink = "#E85B7A",
	dark_pink = "#E44675",
	orange = "#D08F70",
	yellow = "#EBCB8B",
	purple = "#DD99BB",
	light_purple = "#B48EAD",
	none = "NONE",

	active = colors_darker.slate_gray_4,
	float = colors_darker.slate_gray_1,
	highlight = colors_darker.slate_gray_5,
	highlight_dark = colors_darker.slate_gray_6,
	-- selection = colors_darker.slate_gray_3,
	-- selection = default_colors.red,
}

onenord.setup({
	theme = "dark", -- "dark" or "light". Alternatively, remove the option and set vim.o.background instead
	borders = false, -- Split window borders
	fade_nc = false, -- Fade non-current windows, making them more distinguishable
	-- Style that is applied to various groups: see `highlight-args` for options
	styles = {
		comments = "italic",
		strings = "NONE",
		keywords = "italic",
		functions = "bold",
		variables = "bold",
		diagnostics = "bold",
	},
	disable = {
		background = false, -- Disable setting the background color
		cursorline = false, -- Disable the cursorline
		eob_lines = true, -- Hide the end-of-buffer lines
	},
	-- Inverse highlight for different groups
	inverse = {
		match_paren = true,
	},
	custom_highlights = {
		TSConstructor = { fg = dark_nord.orange },
		TSFunction = { fg = dark_nord.yellow },
		TSVariable = { fg = dark_nord.fg_dark },
		TSMethod = { fg = dark_nord.yellow },
		TSKeyword = { fg = dark_nord.dark_blue },
		TSType = { fg = dark_nord.cyan },
		TSProperty = { fg = dark_nord.blue },
		TSParameter = { fg = dark_nord.fg },
		TSString = { fg = dark_nord.light_green },

		-- S/CSS

		-- PreProc = { fg = dark_nord.dark_pink }, -- @include
		StorageClass = { fg = dark_nord.light_gray }, -- CSS Property
	},
	-- Defaults: https://github.com/rmehri01/onenord.nvim/blob/main/lua/onenord/colors/onenord.lua
	custom_colors = dark_nord,
})
