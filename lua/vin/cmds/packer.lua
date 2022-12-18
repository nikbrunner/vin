local plenary_async_status_ok, plenaryAsync = pcall(require, "plenary.async")
if not plenary_async_status_ok then
    return
end

vin.cmds.packer = {}

vin.cmds.packer.sync_with_snapshot = function()
    ---@diagnostic disable-next-line: missing-parameter
    plenaryAsync.run(function()
        vim.notify("Syncing packer.")
    end)

    local snap_shot_time = os.date("!%Y-%m-%dT%TZ")
    vim.cmd("PackerSnapshot " .. snap_shot_time)
    vim.cmd("source lua/vin/plugins.lua")
    vim.cmd("PackerSync --preview")
end
