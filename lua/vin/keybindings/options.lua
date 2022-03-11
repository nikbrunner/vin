local Options = {}

Options.normal = {
	no_leader = {
		mode = "n", -- NORMAL mode
		buffer = nil,
		silent = true,
		noremap = true,
		nowait = true,
	},

	with_leader = {
		mode = "n", -- NORMAL mode
		prefix = "<leader>",
		buffer = nil,
		silent = true,
		noremap = true,
		nowait = true,
	},
}

Options.insert = {
	no_leader = {
		mode = "i", -- VISUAL mode
		buffer = nil,
		silent = true,
		noremap = true,
		nowait = true,
	},
}

Options.visual = {
	no_leader = {
		mode = "v", -- VISUAL mode
		buffer = nil,
		silent = true,
		noremap = true,
		nowait = true,
	},

	with_leader = {
		mode = "v", -- VISUAL mode
		prefix = "<leader>",
		buffer = nil,
		silent = true,
		noremap = true,
		nowait = true,
	},
}

return Options
