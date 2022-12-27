vin.cmds.general = {
    all = {},
    blocks = {},
    line = {},
}

vin.cmds.general.save_all = function()
    vim.cmd([[wa]])
end

-- get the current filename without extension
vin.cmds.general.get_current_filename = function()
    local fileNameWithExt = vim.fn.expand("%:t")
    local dotIndex = string.find(fileNameWithExt, ".", 1, true)

    return vin.lib.ccall(
        dotIndex,
        -- If extension is found return fileName without extension
        function()
            local fileName = string.sub(fileNameWithExt, 1, dotIndex - 1)
            return fileName
        end,
        function()
            vim.notify("get_current_filename()\nParsing filename failed!")
            return nil
        end
    )
end

vin.cmds.general.center_line_vertical = function()
    vim.cmd([[norm zz]])
end

vin.cmds.general.blocks.select = function()
    vim.cmd([[norm ^v$%]])
end

vin.cmds.general.blocks.yank = function()
    vin.cmds.general.blocks.select()
    vim.cmd([[norm y]])
end

vin.cmds.general.blocks.delete = function()
    vin.cmds.general.blocks.select()
    vim.cmd([[norm d]])
end

vin.cmds.general.all.select = function()
    vim.cmd([[norm ggVG]])
end

vin.cmds.general.all.yank = function()
    vin.cmds.general.all.select()
    vim.cmd([[norm y]])
end

vin.cmds.general.all.delete = function()
    vin.cmds.general.all.select()
    vim.cmd([[norm d]])
end
