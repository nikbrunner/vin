local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

---@diagnostic disable-next-line: undefined-field
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

---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup("vin.specs", {
    defaults = {
        lazy = true, -- should plugins be lazy-loaded?
    },
    ---@diagnostic disable-next-line: assign-type-mismatch
    install = {
        colorscheme = {
            "terra_winter_night",
            "default",
            "habamax",
        },
    },
    performance = {
        rtp = {
            -- Add the /plugin directory to the package.path so that vim can find the plugins
            paths = {
                "plugin",
            },
            -- disable some rtp plugins
            disabled_plugins = {
                "netrwPlugin",
            },
        },
    },
    dev = {
        ---@type string | fun(plugin: LazyPlugin): string directory where you store your local plugin projects
        path = function(plugin)
            return require("vin.config").pathes.repos .. plugin[1]
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
        border = "solid",
    },
})
