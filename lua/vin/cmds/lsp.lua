local notify_status_ok, notify = pcall(require, "notify")
if not notify_status_ok then
    return
end

Vin.cmds.lsp = {}

Vin.cmds.lsp.format_file = function()
    vim.lsp.buf.formatting_seq_sync()
    vim.cmd([[silent w]])

    notify("Formated and saved file", "info", {
        timeout = 75,
        render = "minimal",
    })
end

Vin.cmds.lsp.code_action = function()
    vim.lsp.buf.code_action()

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
