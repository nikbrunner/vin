local status_ok, cinnamon = pcall(require, "cinnamon")
if not status_ok then
	return
end

cinnamon.setup({
	-- KEYMAPS:
	default_keymaps = true, -- Create default keymaps.
	extra_keymaps = true, -- Create extra keymaps.
	extended_keymaps = true, -- Create extended keymaps.
	override_keymaps = false, -- Replace any existing keymaps.

	-- OPTIONS:
	always_scroll = true, -- Scroll the cursor even when the window hasn't scrolled.
	centered = true, -- Keep cursor centered in window when using window scrolling.
	default_delay = 7, -- The default delay (in ms) between each line when scrolling.
	hide_cursor = false, -- Hide the cursor when scrolling. Requires enabling termguicolors.
	horizontal_scroll = true, -- Enable smooth horizontal scrolling when view shifts left or right.
	scroll_limit = 150, -- Max number of lines moved before scrolling is skipped.
})
