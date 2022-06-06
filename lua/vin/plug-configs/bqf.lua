local status_ok, bqf = pcall(require, "bqf")
if not status_ok then
	return
end

bqf.setup({
	auto_enable = {
		description = [[enable nvim-bqf in quickfix window automatically]],
		default = true,
	},
	magic_window = {
		description = [[give the window magic, when the window is splited horizontally, keep
            the distance between the current line and the top/bottom border of neovim unchanged.
            It's a bit like a floating window, but the window is indeed a normal window, without
            any floating attributes.]],
		default = true,
	},
	auto_resize_height = {
		description = [[resize quickfix window height automatically.
            Shrink higher height to size of list in quickfix window, otherwise extend height
            to size of list or to default height (10)]],
		default = false,
	},
	preview = {
		auto_preview = {
			description = [[enable preview in quickfix window automatically]],
			default = true,
		},
		win_height = {
			description = [[the height of preview window for horizontal layout]],
			default = 15,
		},
		win_vheight = {
			description = [[the height of preview window for vertical layout]],
			default = 15,
		},
		delay_syntax = {
			description = [[delay time, to do syntax for previewed buffer, unit is millisecond]],
			default = 50,
		},
		border_chars = {
			description = [[border and scroll bar chars, they respectively represent:
                vline, vline, hline, hline, ulcorner, urcorner, blcorner, brcorner, sbar]],
			default = {
				"│",
				"│",
				"─",
				"─",
				"╭",
				"╮",
				"╰",
				"╯",
				"█",
			},
		},
		wrap = {
			description = [[wrap the line, `:h wrap` for detail]],
			default = false,
		},
		should_preview_cb = function(bufnr)
			local ret = true
			local bufname = vim.api.nvim_buf_get_name(bufnr)
			local fsize = vim.fn.getfsize(bufname)
			if fsize > 100 * 1024 then
				-- skip file size greater than 100k
				ret = false
			elseif bufname:match("^fugitive://") then
				-- skip fugitive buffer
				ret = false
			end
			return ret
		end,
	},
	-- make `drop` and `tab drop` to become preferred
	func_map = {
		drop = "o",
		openc = "O",
		split = "<C-s>",
		tabdrop = "<C-t>",
		tabc = "",
		ptogglemode = "z,",
	},
	filter = {
		fzf = {
			action_for = {
				["ctrl-t"] = {
					description = [[press ctrl-t to open up the item in a new tab]],
					default = "tabedit",
				},
				["ctrl-v"] = {
					description = [[press ctrl-v to open up the item in a new vertical split]],
					default = "vsplit",
				},
				["ctrl-x"] = {
					description = [[press ctrl-x to open up the item in a new horizontal split]],
					default = "split",
				},
				["ctrl-q"] = {
					description = [[press ctrl-q to toggle sign for the selected items]],
					default = "signtoggle",
				},
			},
			extra_opts = {
				description = "extra options for fzf",
				default = { "--bind", "ctrl-o:toggle-all" },
			},
		},
	},
})
