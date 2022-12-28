local lsp_zero_present, lsp_zero = pcall(require, "lsp-zero")
if not lsp_zero_present then
    return
end

local merge = Vin.lib.utils.merge

lsp_zero.preset("recommended")

lsp_zero.ensure_installed(Vin.config.lsp.required_servers)

lsp_zero.set_preferences({
    suggest_lsp_servers = true,
    setup_servers_on_start = true,
    set_lsp_keymaps = false, -- Manually set
    configure_diagnostics = true,
    cmp_capabilities = true,
    manage_nvim_cmp = true,
    call_servers = "local",
    sign_icons = {
        error = "✘",
        warn = "▲",
        hint = "⚑",
        info = "",
    },
})

-- Setup Vim Diagnostic Settings
vim.diagnostic.config({
    virtual_text = {
        prefix = "●",
    },
    update_in_insert = true,
    float = {
        source = "always", -- Or "if_many"
        border = "rounded",
    },
})

local shared_lsp_opts = {
    -- NOTE: `opts` is a required property for providing options to all mentioned servers
    opts = {
        flags = {
            debounce_text_changes = 75,
        },
    },
}

lsp_zero.setup_servers(merge({
    required_servers,
    shared_lsp_opts,
}))

require("vin.plugins.configs.lsp.null-ls")
require("vin.plugins.configs.lsp.jsonls")
require("vin.plugins.configs.lsp.sumneko_lua")
require("vin.plugins.configs.lsp.denols")

-- NOTE: Must be called after all of server configurations
lsp_zero.setup()

-- Needs to be called after lsp_zero setup so that the settings don't get overwritten
require("vin.plugins.configs.lsp.cmp")

-- Other needed lsp tools
require("vin.plugins.configs.lsp.lspsignature")
