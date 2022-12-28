local join = Vin.lib.utils.join


-- TODO: Use $XDG_.. Variables
local HOME_PATH = "~/"
local CONFIG_PATH = join(HOME_PATH, ".config/")
local DOCUMENTS_PATH = join(HOME_PATH, "Documents/")
local NOTES_PATH = join(DOCUMENTS_PATH, "notes/")

Vin.config = {
    colorscheme = "terra",
    pathes = {
        config = CONFIG_PATH,
        nvimConfig = join(CONFIG_PATH, "nvim/"),
        notes = {
            work = join(NOTES_PATH, "dcd-notes"),
            private = join(NOTES_PATH, "notes"),
        },
    },
}
