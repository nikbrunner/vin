local status_ok, incline = pcall(require, "incline")
if not status_ok then
	return
end

incline.setup({
	debounce_threshold = {
		falling = 50,
		rising = 10,
	},
	hide = {
		cursorline = true,
		focused_win = false,
		only_win = false,
	},
	highlight = {
		groups = {
			InclineNormal = {
				default = true,
				group = "NormalFloat",
			},
			InclineNormalNC = {
				default = true,
				group = "NormalFloat",
			},
		},
	},
	ignore = {
		buftypes = "special",
		filetypes = {},
		floating_wins = true,
		unlisted_buffers = true,
		wintypes = "special",
	},
	-- render = "basic",
	render = function(props)
		local fnamemodify = vim.fn.fnamemodify

		local bufname = vim.api.nvim_buf_get_name(props.buf)
		local rel_filename = fnamemodify(bufname, ":.")
		local extension = fnamemodify(bufname, ":e")

		local icon = require("nvim-web-devicons").get_icon(
			rel_filename,
			extension,
			{ default = true }
		)

		if bufname == "" then
			return "[No name]"
		else
			return rel_filename .. " " .. icon
		end
	end,
	window = {
		margin = {
			horizontal = 0,
			vertical = 0,
		},
		options = {
			signcolumn = "no",
			wrap = false,
		},
		padding = 2,
		padding_char = " ",
		placement = {
			vertical = "top",
			horizontal = "right",
		},
		width = "fit",
		winhighlight = {
			active = {
				EndOfBuffer = "None",
				Normal = "InclineNormal",
				Search = "None",
			},
			inactive = {
				EndOfBuffer = "None",
				Normal = "InclineNormalNC",
				Search = "None",
			},
		},
		zindex = 50,
	},
})
