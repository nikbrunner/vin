local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

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

require("vin.keymaps")
require("vin.options")
require("lazy").setup("vin.specs", {
    ---@diagnostic disable-next-line: assign-type-mismatch
    install = {
        colorscheme = {
            "terra",
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
    ui = {
        size = { width = 0.8, height = 0.8 },
        border = "single",
    },
})
