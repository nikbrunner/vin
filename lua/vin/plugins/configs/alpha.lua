local present, alpha = pcall(require, "alpha")
if not present then
    return
end

local function vim_version()
    local version = vim.version()
    if version == nil then
        return
    end

    local version_string = "Neovim "
        .. version.major
        .. "."
        .. version.minor
        .. "."
        .. version.patch

    return {
        type = "text",
        val = version_string,
        opts = {
            position = "center",
            hl = "String",
        },
    }
end

local function get_greeting(name)
    local table_time = os.date("*t")

    local hour = table_time.hour

    local greetings_map = {
        [1] = "  It's bedtime",
        [2] = "  Good morning",
        [3] = "  Good afternoon",
        [4] = "  Good evening",
        [5] = "望 Good night",
    }

    local greeting_index = 0

    if hour == 23 or hour < 7 then
        greeting_index = 1
    elseif hour < 12 then
        greeting_index = 2
    elseif hour >= 12 and hour < 18 then
        greeting_index = 3
    elseif hour >= 18 and hour < 21 then
        greeting_index = 4
    elseif hour >= 21 then
        greeting_index = 5
    end
    return greetings_map[greeting_index] .. ", " .. name
end

local greeting = get_greeting(Vin.config.username)

local greet_heading = {
    type = "text",
    val = greeting,
    opts = {
        position = "center",
        hl = "String",
    },
}

local get_plugin_count = function()
    local stats = require("lazy").stats()
    if stats == nil or stats.count == 0 then
        return "N/A"
    else
        return stats.count
    end
end

local plugin_count = {
    type = "text",
    val = "  " .. get_plugin_count() .. " plugins",
    opts = {
        position = "center",
        hl = "String",
    },
}

-- QUESTION: Do I need this?
local function button(shortcut, text, keybind)
    local shortcut_ = shortcut:gsub("%s", ""):gsub("SPC", "<leader>")

    local opts = {
        position = "center",
        text = text,
        shortcut = shortcut,
        cursor = 6,
        width = 19,
        align_shortcut = "right",
        hl_shortcut = "Number",
        hl = "Function",
    }

    if keybind then
        opts.keymap = { "n", shortcut_, keybind, { noremap = true, silent = true } }
    end

    return {
        type = "button",
        val = text,
        on_press = function()
            local key = vim.api.nvim_replace_termcodes(shortcut_, true, false, true)
            vim.api.nvim_feedkeys(key, "normal", false)
        end,
        opts = opts,
    }
end

local buttons = {
    type = "group",
    val = {
        button(".", "   Curr. Dir", ":edit .<CR>"),
        button("h", "   History", ":Telescope oldfiles<CR>"),
        button("p", "   Projects", ":Telescope project<CR>"),
        button("e", "   New Empty", ":ene <BAR> startinsert<CR>"),
        button(
            "c",
            "   Config",
            Vin.lib.utils.join(":e ", Vin.config.pathes.nvimConfig, "<CR>")
        ),
        button("q", "   Quit", ":qa!<CR>"),
        -- button("s", "   Load", ":SessionManager load_session<CR>"),
        -- button(
        --     "l",
        --     "   Load Current",
        --     ":SessionManager load_current_dir_session<CR>"
        -- ),
    },
    opts = {
        position = "center",
        spacing = 1,
    },
}

local section = {
    buttons = buttons,
    greet_heading = greet_heading,
    vim_version = vim_version(),
    plugin_count = plugin_count,
}

local opts = {
    layout = {
        { type = "padding", val = 4 },
        section.greet_heading,
        { type = "padding", val = 3 },
        section.vim_version,
        section.plugin_count,
        { type = "padding", val = 3 },
        section.buttons,
        { type = "padding", val = 2 },
    },
    opts = {
        margin = 44,
    },
}
alpha.setup(opts)
