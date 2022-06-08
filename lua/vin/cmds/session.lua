Vin.cmds.session = {}

Vin.cmds.session.load = function()
	require("session_manager").load_session()
end

-- No notification here. Seems to be a runtime issue
Vin.cmds.session.load_last = function()
	require("session_manager").load_last_session()
end

Vin.cmds.session.load_current_dir = function()
	require("session_manager").load_current_dir_session()
end

Vin.cmds.session.save_current = function()
	require("session_manager").save_current_session()
end

Vin.cmds.session.delete = function()
	require("session_manager").delete_session()
end
