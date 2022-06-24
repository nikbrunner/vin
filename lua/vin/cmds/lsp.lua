local notify_status_ok, notify = pcall(require, "notify")
if not notify_status_ok then
	return
end

Vin.cmds.lsp = {}

Vin.cmds.lsp.format_file = function()
	vim.lsp.buf.format({ async = true })
	vim.cmd([[silent w]])

	notify("Formated and saved file", "info", {
		timeout = 75,
		render = "minimal",
	})
end

Vin.cmds.lsp.code_action = function()
	-- vim.lsp.buf.code_action()
	vim.cmd([[CodeActionMenu]])

	notify("Pick a Code Action!", "info", {
		title = "Refactor",
		timeout = 125,
		icon = " ",
	})
end

-- returns a table containing the lsp changes counts from an lsp result
local function count_lsp_res_changes(lsp_res)
	local count = { instances = 0, files = 0 }
	if lsp_res.documentChanges then
		for _, changed_file in pairs(lsp_res.documentChanges) do
			count.files = count.files + 1
			count.instances = count.instances + #changed_file.edits
		end
	elseif lsp_res.changes then
		for _, changed_file in pairs(lsp_res.changes) do
			count.instances = count.instances + #changed_file
			count.files = count.files + 1
		end
	end
	return count
end

Vin.cmds.lsp.rename = function()
	local curr_name = vim.fn.expand("<cword>")
	local input_opts = {
		prompt = "New name?",
		default = curr_name,
	}
	-- ask user input
	vim.ui.input(input_opts, function(new_name)
		-- check new_name is valid
		if not new_name or #new_name == 0 or curr_name == new_name then
			return
		end

		-- request lsp rename
		local params = vim.lsp.util.make_position_params()
		params.newName = new_name

		vim.lsp.buf_request(
			0,
			"textDocument/rename",
			params,
			function(_, res, ctx, _)
				if not res then
					return
				end

				-- apply renames
				local client = vim.lsp.get_client_by_id(ctx.client_id)
				vim.lsp.util.apply_workspace_edit(res, client.offset_encoding)

				-- display a message
				local changes = count_lsp_res_changes(res)
				local message = string.format(
					"Renamed %s instance%s in %s file%s. %s",
					changes.instances,
					changes.instances == 1 and "" or "s",
					changes.files,
					changes.files == 1 and "" or "s",
					changes.files > 1 and "To save them run ':wa'!" or ""
				)

				notify(message, "info", {
					title = "Renamed '" .. curr_name .. "' to '" .. new_name .. "'",
					timeout = 500,
					icon = "🧙",
				})
			end
		)
	end)
end

vim.api.nvim_create_user_command("VinLspRename", Vin.cmds.lsp.rename, {})
