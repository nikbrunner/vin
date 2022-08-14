local status_ok, close = pcall(require, "close_buffers")
if not status_ok then
    return
end

---@class Quit
Vin.cmds.quit = {}

Vin.cmds.quit.current_buffer = function()
    close.delete({ type = "this" })
end

Vin.cmds.quit.other_buffers = function()
    close.delete({ type = "other" })
end

Vin.cmds.quit.hidden_buffers = function()
    close.delete({ type = "hidden", force = true })
end

Vin.cmds.quit.all_buffers = function()
    close.delete({ type = "all", force = true })
end

Vin.cmds.quit.custom_buffers = function()
    vim.ui.input({
        prompt = "Enter Glob Pattern",
        default = "*.story",
    }, function(input)
        close.wipe({ glob = input })
    end)
end
