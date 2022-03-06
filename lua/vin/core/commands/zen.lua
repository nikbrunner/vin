local status_ok, zen_mode = pcall(require, "zen-mode")
if not status_ok then
	return
end

local Zen = {}

Zen.toggle_full_screen = function()
	-- Default without opts is full screen
	zen_mode.toggle()
end

-- This would be cool, but the backdrop doesnt get transparent
Zen.toggle_small_screen = function()
	-- Default without opts is full screen
	zen_mode.toggle({
		window = {
			backdrop = 0.65,
			width = 0.75,
			height = 0.75,
		},
	})
end

return Zen
