local M = {}

---Notification which conditionally calls `nvim-notify` when available
---@param message string Notification message
---@param level number Log level - Use `vim.log.levels`
---@param opts? table<string, any> nvim-notify options. See notify.Options
---@return nil
---@usage
---```lua
----- Example:
---notify("Hello World", vim.log.levels.INFO, { title = "Hello" })
---```
function M.notify(message, level, opts)
    level = level or vim.log.levels.INFO
    opts = opts or {}

    local nvim_notify_ok, nvim_notify = pcall(require, "notify")

    if nvim_notify_ok then
        nvim_notify(message, level, opts)
    else
        vim.api.nvim_notify(message, level, opts)
    end
end

return M
