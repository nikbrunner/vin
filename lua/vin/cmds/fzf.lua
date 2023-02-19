local status_ok, fzf = pcall(require, "fzf-lua")
if not status_ok then
    print("fzf-lua not installed")
    return
end

local utils = require("vin.lib.utils")

M = {
    win_presets = {},
    files = {},
    lsp = {},
    git = {},
    misc = {},
}

M.win_presets = {
    small = {
        no_preview = {
            winopts = {
                height = 0.25,
                width = 0.35,
                preview = {
                    hidden = "hidden",
                },
            },
        },
    },
    medium = {
        vertical = {
            winopts = {
                height = 0.65,
                width = 0.65,
                preview = {
                    layout = "vertical",
                    vertical = "up:65%",
                },
            },
        },
    },
    large = {
        vertical = {
            winopts = {
                height = 0.9,
                width = 0.9,
                preview = {
                    layout = "vertical",
                    vertical = "up:65%",
                },
            },
        },
    },
    full = {
        vertical = {
            winopts = {
                fullscreen = true,
                preview = {
                    layout = "vertical",
                    vertical = "up:65%",
                },
            },
        },
    },
}

M.fzf = function(cmd, opts)
    opts = opts or {}
    return function()
        fzf[cmd](opts)
    end
end

M.files = {
    ---@param opts? table Additional args to pass to fzf (Defaults get overwritten)
    without_preview = function(opts)
        opts = opts or {}
        local merged_opts =
            vim.tbl_deep_extend("force", M.win_presets.small.no_preview, opts)
        M.fzf("files", merged_opts)()
    end,
    ---@param opts? table Additional args to pass to fzf (Defaults get overwritten)
    with_preview = function(opts)
        opts = opts or {}
        local merged_opts =
            vim.tbl_deep_extend("force", M.win_presets.medium.vertical, opts)
        M.fzf("files", merged_opts)()
    end,
    old_files = M.fzf("oldfiles", M.win_presets.medium.vertical),
    buffers = M.fzf("buffers", M.win_presets.small.no_preview),
    in_dir = function(cwd)
        M.files.with_preview({
            cwd = cwd,
        })
    end,
}

M.text = {
    in_file = M.fzf("grep_curbuf", M.win_presets.medium.vertical),
    in_project = M.fzf("live_grep_native", M.win_presets.full.vertical),
    word = M.fzf("grep_cword", M.win_presets.medium.vertical),
}

M.lsp = {
    defintions = M.fzf("lsp_definitions", M.win_presets.medium.vertical),
    references = M.fzf("lsp_references", M.win_presets.medium.vertical),
    implementations = M.fzf("lsp_implementations", M.win_presets.medium.vertical),
    type_definitions = M.fzf("lsp_typedefs", M.win_presets.medium.vertical),
    symbols = {
        document = M.fzf("lsp_document_symbols", M.win_presets.medium.vertical),
        workspace = M.fzf("lsp_workspace_symbols", M.win_presets.medium.vertical),
    },
    diagnostics = {
        document = M.fzf("lsp_document_diagnostics", M.win_presets.large.vertical),
        workspace = M.fzf("lsp_workspace_diagnostics", M.win_presets.large.vertical),
    },
}

M.git = {
    status = M.fzf("git_status", M.win_presets.small.no_preview),
    status_with_preview = M.fzf("git_status", M.win_presets.large.vertical),
    branches = M.fzf("git_branches", M.win_presets.small.no_preview),
    commits = M.fzf("git_commits", M.win_presets.small.no_preview),
}

M.misc = {
    help_tags = M.fzf("help_tags", M.win_presets.large.vertical),
    man_page = M.fzf("man_page", M.win_presets.large.vertical),
    highlights = M.fzf("highlights", M.win_presets.medium.vertical),
    registers = M.fzf("registers", M.win_presets.medium.vertical),
    commands = M.fzf("commands", M.win_presets.small.vertical),
    keymaps = M.fzf("keymaps", M.win_presets.small.vertical),
}

return M
