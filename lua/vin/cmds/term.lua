local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end

local Terminal = require("toggleterm.terminal").Terminal

Vin.cmds.term = {}

Vin.cmds.term.lazygit = function()
	local lazygit = Terminal:new({
		cmd = "lazygit",
		hidden = true,
		direction = "float",
	})

	lazygit:toggle()
end

Vin.cmds.term.node = function()
	local node = Terminal:new({
		cmd = "node",
		direction = "float",
		hidden = true,
	})

	node:toggle()
end

Vin.cmds.term.htop = function()
	local htop = Terminal:new({
		cmd = "htop",
		direction = "float",
		hidden = true,
		close_on_exit = true,
	})

	htop:toggle()
end

Vin.cmds.term.python = function()
	local python = Terminal:new({
		cmd = "python",
		direction = "float",
		hidden = true,
	})

	python:toggle()
end
