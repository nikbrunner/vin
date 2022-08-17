local present, possession = pcall(require, "possession")
if not present then
    return
end

possession.setup({
    silent = false,
    load_silent = true,
    debug = false,
    prompt_no_cr = false,
    autosave = {
        current = true, -- or fun(name): boolean
        tmp = false, -- or fun(): boolean
        tmp_name = "tmp",
        on_load = false,
        on_quit = true,
    },
    commands = {
        save = "SessionSave",
        load = "SessionLoad",
        close = "SessionClose",
        delete = "SessionDelete",
        show = "SessionShow",
        list = "SessionList",
        migrate = "SessionMigrate",
    },
    hooks = {
        before_save = function(name)
            return {}
        end,
        after_save = function(name, user_data, aborted) end,
        before_load = function(name, user_data)
            return user_data
        end,
        after_load = function(name, user_data) end,
    },
    plugins = {
        close_windows = {
            hooks = { "before_save" },
            preserve_layout = true, -- or fun(win): boolean
            match = {
                floating = true,
                buftype = {},
                filetype = {},
                custom = false, -- or fun(win): boolean
            },
        },
        delete_buffers = true,
        delete_hidden_buffers = false,
        nvim_tree = true,
        tabby = true,
    },
})
