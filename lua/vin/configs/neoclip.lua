local status_ok, neoclip = pcall(require, "neoclip")
if not status_ok then
	return
end

-- TODO Fix default register

neoclip.setup({
	history = 1000,
	filter = nil,
	preview = true,
  default_register = { '"' },
	default_register_macros = "q",
	enable_macro_history = true,
	content_spec_column = false,
	on_paste = {
		set_reg = false,
	},
	on_replay = {
		set_reg = false,
	},
	keys = {
		telescope = {
			i = {
				select = "<CR>",
				paste = "<C-p>",
				paste_behind = "<C-k>",
				replay = "<C-q>",
				custom = {},
			},
			n = {
				select = "<CR>",
				paste = "p",
				paste_behind = "P",
				replay = "q",
				custom = {},
			},
		},
		fzf = {
			select = "default",
			paste = "ctrl-p",
			paste_behind = "ctrl-k",
			custom = {},
		},
	},
})
