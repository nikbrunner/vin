-- Automatically install plugin manager
-- https://github.com/folke/lazy.nvim#-installation
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--single-branch",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
end

vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup(require("vin.plugins.list"), require("vin.plugins.options"))

-- get all names of files in the plugins.configs directory
local plugin_configs = vim.fn.readdir(
    Vin.config.pathes.nvimConfig .. "/lua/vin/plugins/configs"
)
-- remove all file extensions from the names in plugin_configs
for i, v in ipairs(plugin_configs) do
    plugin_configs[i] = v:gsub("%..*", "")
end

-- load all plugin configs
local load_config = function(plugin)
    local CONFIGS_MODULE_PATH = "vin.plugins.configs"

    local ok, _ = pcall(
        require,
        Vin.lib.utils.join(CONFIGS_MODULE_PATH, ".", plugin)
    )

    if not ok then
        print("Failed to load config for " .. plugin)
    end
end

for _, plugin in ipairs(plugin_configs) do
    load_config(plugin)
end
