local status_ok, luapad = pcall(require, "luapad")
if not status_ok then
	return
end

luapad.setup({
	count_limit = 150000,
	error_indicator = false,
	eval_on_move = true,
	error_highlight = "WarningMsg",
	split_orientation = "vertical",
	on_init = function()
		print("Hello from Luapad!")
	end,
	context = {
		the_answer = 42,
		shout = function(str)
			return (string.upper(str) .. "!")
		end,
	},
})
