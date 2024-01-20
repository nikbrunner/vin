local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local repos_path = "~/Documents/dev/repos/"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup("vin.specs", {
    defaults = {
        lazy = true, -- should plugins be lazy-loaded?
    },
    ---@diagnostic disable-next-line: assign-type-mismatch
    install = {
        colorscheme = {
            "terra_winter_night",
            "habamax",
        },
    },
    performance = {
        rtp = {
            -- disable some rtp plugins
            disabled_plugins = {
                "netrwPlugin",
            },
        },
    },
    dev = {
        ---@type string | fun(plugin: LazyPlugin): string directory where you store your local plugin projects
        path = function(plugin)
            return repos_path .. plugin[1]
        end,
    },
    checker = {
        -- automatically check for plugin updates
        enabled = true,
        notify = false, -- get a notification when new updates are found
        frequency = 3600, -- check for updates every hour
    },
    change_detection = {
        -- automatically check for config file changes and reload the ui
        enabled = true,
        notify = false, -- get a notification when changes are found
    },
    ui = {
        size = { width = 0.8, height = 0.8 },
        border = "single",
    },
})
