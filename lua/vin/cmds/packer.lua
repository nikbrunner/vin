local notify_status_ok, notify = pcall(require, "notify")
if not notify_status_ok then
	return
end

local plenary_async_status_ok, plenaryAsync = pcall(require, "plenary.async")
if not plenary_async_status_ok then
	return
end

Vin.cmds.packer = {}

Vin.cmds.packer.sync_with_snapshot = function()
	plenaryAsync.run(function()
		notify.async("Syncing packer.", "info", {
			title = "Packer",
		})
	end)

	local snap_shot_time = os.date("!%Y-%m-%dT%TZ")
	vim.cmd("PackerSnapshot " .. snap_shot_time)
	vim.cmd("source lua/vin/plugins.lua")
	vim.cmd("PackerSync")
end
