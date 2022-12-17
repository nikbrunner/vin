local picker_ok, picker = pcall(require, "window-picker")
if not picker_ok then
    return
end

Vin.cmds.nav = {}

Vin.cmds.nav.pick_window = function()
    local picked_window_id = picker.pick_window()

    if picked_window_id then
        vim.api.nvim_set_current_win(picked_window_id)
    else
        vim.notify("   Something went wrong\nPicked Window Id is `nil`")
        return
    end
end
