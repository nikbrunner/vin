local status_ok, onenord = pcall(require, "onenord")
if not status_ok then
	return
end

local arvo = require("vin.core.colorscheme.arvo")

local default_colors = require("onenord.colors").load()

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
	custom_highlights = arvo.custom_highlights(),
	custom_colors = arvo.colors(),
})
