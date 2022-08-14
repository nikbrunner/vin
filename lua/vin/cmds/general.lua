local notify_status_ok, notify = pcall(require, "notify")
if not notify_status_ok then
    return
end

Vin.cmds.general = {
    all = {},
    blocks = {},
    line = {},
}

Vin.cmds.general.save_all = function()
    vim.cmd([[silent wa]])
    vim.cmd([[silent ColorizerAttachToBuffer]])

    -- notify("Saved all files!", "info", {
    -- 	timeout = 125,
    -- 	render = "minimal",
    -- })
end

Vin.cmds.save_and_exit = function()
    Vin.cmds.general.save_all()
    vim.cmd(":qa!")
end

-- get the current filename without extension
Vin.cmds.general.get_current_filename = function()
    local fileNameWithExt = vim.fn.expand("%:t")
    local dotIndex = string.find(fileNameWithExt, ".", 1, true)

    return Vin.lib.ccall(
        dotIndex,
        -- If extension is found return fileName without extension
        function()
            local fileName = string.sub(fileNameWithExt, 1, dotIndex - 1)
            return fileName
        end,
        function()
            notify("get_current_filename()\nParsing filename failed!", "warn")
            return nil
        end
    )
end

Vin.cmds.general.blocks.select = function()
    vim.cmd([[norm ^v$%]])
end

Vin.cmds.general.blocks.yank = function()
    Vin.cmds.general.blocks.select()
    vim.cmd([[norm y]])
end

Vin.cmds.general.blocks.delete = function()
    Vin.cmds.general.blocks.select()
    vim.cmd([[norm d]])
end

Vin.cmds.general.all.select = function()
    vim.cmd([[norm ggVG]])
end

Vin.cmds.general.all.yank = function()
    Vin.cmds.general.all.select()
    vim.cmd([[norm y]])
end

Vin.cmds.general.all.delete = function()
    Vin.cmds.general.all.select()
    vim.cmd([[norm d]])
end

Vin.cmds.general.line.select = function()
    vim.cmd([[norm ^v$]])
end
