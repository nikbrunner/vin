local status_ok, tabby = pcall(require, "tabby")
if not status_ok then
	return
end

-- https://github.com/nanozuki/tabby.nvim
tabby.setup({
	tabline = require("tabby.presets").active_wins_at_tail,
})
