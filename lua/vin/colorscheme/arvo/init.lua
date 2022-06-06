local status_ok, onenord = pcall(require, "onenord")
if not status_ok then
	return
end

local M = {}

-- Everything in here is just temporary, until Arvo becomes it's own theme
-- https://www.figma.com/file/WvxEHBxgquwj7W2fiO2q9k/Arvo?node-id=0%3A1

M.semantic = function()
	return {
		bg = {
			very_dark = "#19202A",
			dark = "#1B222D",
			main = "#1D2530",
			light = "#273241",
			very_light = "#313F52",
		},
	}
end

M.colors = function()
	local bg = M.semantic().bg

	return {
		fg_dark = "#d8dee9",
		fg = "#e5e9f0",
		fg_light = "#eceff4",
		bg_very_dark = bg.very_dark,
		bg_dark = bg.dark,
		bg = bg.main,
		bg_light = bg.light,
		bg_very_light = bg.very_light,
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

		-- active = M.slate_gray[6],
		active = bg.light,
		float = bg.very_dark,
		highlight = bg.very_light,
		highlight_dark = bg.light,
		-- selection = "#EBCB8B", -- search results from /
	}
end

M.custom_highlights = function()
	local bg = M.semantic().bg

	return {
		NeoTreeNormal = { bg = bg.very_dark },
		NeoTreeNormalNC = { bg = bg.very_dark },
		NeoTreeIndentMarker = { fg = M.colors().dark_blue },
		NeoTreeExpander = { fg = M.colors().dark_blue },
		NeoTreeFloatBorder = { fg = M.colors().dark_blue, bg = nil },
		NeoTreeFloatTitle = { fg = M.colors().fg, bg = nil },
		-- NeoTreeWinSeparator = { bg = M.colors().cyan },

		TelescopeSelection = { fg = M.colors().fg, bg = bg.very_dark },

		WhichKeyFloat = { bg = bg.very_dark },

		FloatBorder = { bg = bg.very_dark },

		NormalFloat = { bg = bg.main },
		TabLineFill = { bg = bg.main },

		TSConstructor = { fg = M.colors().orange },
		TSFunction = { fg = M.colors().yellow },
		TSVariable = { fg = M.colors().fg_dark },
		TSMethod = { fg = M.colors().yellow },
		TSKeyword = { fg = M.colors().dark_blue },
		TSType = { fg = M.colors().cyan },
		TSProperty = { fg = M.colors().blue },
		TSParameter = { fg = M.colors().fg },
		TSString = { fg = M.colors().light_green },
		TSTypeBuiltin = { fg = M.colors().cyan },

		StorageClass = { fg = M.colors().fg_dark }, -- CSS Property
		sassMixing = { fg = M.colors().pink }, -- CSS Property
		sassVariable = { fg = M.colors().orange }, -- CSS Property
		sassDefinition = { fg = M.colors().dark_blue }, -- CSS Property
	}
end

M.setup = function()
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
			diagnostics = "underline",
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

		-- Defaults: https://github.com/rmehri01/onenord.nvim/blob/main/lua/onenord/colors/onenord.lua
		custom_highlights = M.custom_highlights(),
		custom_colors = M.colors(),
	})
end

if Vin.colorscheme.arvo.is_enabled then
	M.setup()
end

return M
