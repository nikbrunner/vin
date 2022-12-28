local status_ok, close = pcall(require, "close_buffers")
if not status_ok then
    return
end

local M = {}

M.current_buffer = function()
    close.delete({ type = "this" })
end

M.other_buffers = function()
    close.delete({ type = "other" })
end

M.hidden_buffers = function()
    close.delete({ type = "hidden", force = true })
end

M.all_buffers = function()
    close.delete({ type = "all", force = true })
end

M.custom_buffers = function()
    vim.ui.input({
        prompt = "Enter Glob Pattern",
        default = "*.story",
    }, function(input)
        close.wipe({ glob = input })
    end)
end

return M
