local notify_status_ok, notify = pcall(require, "notify")
if not notify_status_ok then
	return
end

Vin.cmds.session = {}

---@param message string
---@return nil
local session_manager_notification = function(message)
	notify(message, "info", {
		title = "Session Manager",
		icon = " ",
		timeout = 1000,
	})
end

Vin.cmds.session.load = function()
	require("session_manager").load_session()
	session_manager_notification("Pick a Session")
end

Vin.cmds.session.load_last = function()
	require("session_manager").load_last_session()
	session_manager_notification("Loaded last Session")
end

Vin.cmds.session.load_current_dir = function()
	require("session_manager").load_current_dir_session()
  -- No notification here. Seems to be a runtime issue
end

Vin.cmds.session.save_current = function()
	require("session_manager").save_current_session()
	session_manager_notification("Saved current Session")
end

Vin.cmds.session.delete = function()
	require("session_manager").delete_session()
	session_manager_notification("Delete a Session")
end
