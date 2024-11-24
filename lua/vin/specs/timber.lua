---@type LazyPluginSpec
return {
    "Goose97/timber.nvim",
    version = "*",
    event = "VeryLazy",
    opts = {
        log_templates = {
            default = {
                javascript = [[console.log("DEBUG: %identifier", %identifier)]],
                typescript = [[console.log("DEBUG: %identifier", %identifier)]],
                jsx = [[console.log("DEBUG: %identifier", %identifier)]],
                tsx = [[console.log("DEBUG: %identifier", %identifier)]],
                lua = [[print("DEBUG: %identifier", %identifier)]],
            },
        },
        batch_log_templates = {
            default = {
                javascript = [[console.log("DEBUG:", { %repeat<"%identifier": %identifier><, > })]],
                typescript = [[console.log("DEBUG:", { %repeat<"%identifier": %identifier><, > })]],
                jsx = [[console.log("DEBUG:", { %repeat<"%identifier": %identifier><, > })]],
                tsx = [[console.log("DEBUG:", { %repeat<"%identifier": %identifier><, > })]],
                lua = [[print(string.format("DEBUG: %repeat<%identifier=%s><, >", %repeat<%identifier><, >))]],
            },
        },
        keymaps = {
            insert_log_below = "clj",
            insert_log_above = "clk",
            insert_batch_log = "clb",
            add_log_targets_to_batch = "cla",
            insert_log_below_operator = "c<S-l>j",
            insert_log_above_operator = "c<S-l>k",
            insert_batch_log_operator = "c<S-l>b",
            add_log_targets_to_batch_operator = "c<S-l>a",
        },
        default_keymaps_enabled = false,
    },
}
