local status_ok, close = pcall(require, "close_buffers")
if not status_ok then
    return
end

---@class Quit
vin.cmds.quit = {}

vin.cmds.quit.current_buffer = function()
    close.delete({ type = "this" })
end

vin.cmds.quit.other_buffers = function()
    close.delete({ type = "other" })
end

vin.cmds.quit.hidden_buffers = function()
    close.delete({ type = "hidden", force = true })
end

vin.cmds.quit.all_buffers = function()
    close.delete({ type = "all", force = true })
end

vin.cmds.quit.custom_buffers = function()
    vim.ui.input({
        prompt = "Enter Glob Pattern",
        default = "*.story",
    }, function(input)
        close.wipe({ glob = input })
    end)
end
