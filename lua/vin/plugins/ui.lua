return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        cmd = "Neotree",
        -- QUESTION: What does this?
        deactivate = function()
            vim.cmd([[Neotree close]])
        end,
        init = function()
            vim.g.neo_tree_remove_legacy_commands = 1
            if vim.fn.argc() == 1 then
                local stat = vim.loop.fs_stat(vim.fn.argv(0))
                if stat and stat.type == "directory" then
                    require("neo-tree")
                end
            end
        end,
        opts = {
            filesystem = {
                bind_to_cwd = false,
                follow_current_file = true,
            },
            nesting_rules = {
                ["ts"] = { "spec.ts" },
            },
            window = { -- see https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/popup for
                -- possible options. These can also be functions that return these options.
                position = "left", -- left, right, top, bottom, float, current
                width = 40, -- applies to left and right positions
                mappings = {
                    ["<space>"] = {
                        "toggle_node",
                        nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use
                    },
                    ["<2-LeftMouse>"] = "open",
                    ["<cr>"] = "open",
                    ["<esc>"] = "revert_preview",
                    ["P"] = { "toggle_preview", config = { use_float = true } },
                    ["s"] = "open_split",
                    ["S"] = "split_with_window_picker",
                    ["v"] = "open_vsplit",
                    ["V"] = "vsplit_with_window_picker",
                    ["t"] = "open_tabnew",
                    ["w"] = "open_with_window_picker",
                    ["C"] = "close_node",
                    ["M"] = "close_all_nodes",
                    ["O"] = "expand_all_nodes",
                    ["R"] = "refresh",
                    ["a"] = {
                        "add",
                        -- some commands may take optional config options, see `:h neo-tree-mappings` for details
                        config = {
                            show_path = "none", -- "none", "relative", "absolute"
                        },
                    },
                    ["A"] = "add_directory", -- also accepts the config.show_path option.
                    ["d"] = "delete",
                    ["r"] = "rename",
                    ["y"] = "copy_to_clipboard",
                    ["x"] = "cut_to_clipboard",
                    ["p"] = "paste_from_clipboard",
                    ["c"] = "copy", -- takes text input for destination, also accepts the config.show_path option
                    ["m"] = "move", -- takes text input for destination, also accepts the config.show_path option
                    ["e"] = "toggle_auto_expand_width",
                    ["q"] = "close_window",
                    ["?"] = "show_help",
                    ["<"] = "prev_source",
                    [">"] = "next_source",
                },
            },
        },
    },

    {
        "akinsho/bufferline.nvim",
        event = "VeryLazy",
        opts = {
            options = {
                diagnostics = "nvim_lsp",
                always_show_bufferline = false,
                show_tab_indicators = false,
                diagnostics_indicator = function(_, _, diag)
                    local icons = Vin.icons.diagnostics
                    local ret = (
                        diag.error and icons.Error .. diag.error .. " " or ""
                    )
                        .. (diag.warning and icons.Warning .. diag.warning or "")
                    return vim.trim(ret)
                end,
                offsets = {
                    {
                        filetype = "neo-tree",
                        text = "File Explorer",
                        highlight = "NeoTreeFileIcon",
                        text_align = "left",
                        separator = "│", -- use a "true" to enable the default, or set your own character
                    },
                },
            },
        },
    },

    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
        opts = {
            lsp = {
                progress = {
                    enabled = false,
                    -- Lsp Progress is formatted using the builtins for lsp_progress. See config.format.builtin
                    -- See the section on formatting for more details on how to customize.
                    --- @type NoiceFormat|string
                    format = "lsp_progress",
                    --- @type NoiceFormat|string
                    format_done = "lsp_progress_done",
                    throttle = 1000 / 30, -- frequency to update lsp progress message
                    view = "mini",
                },
                override = {
                    -- override the default lsp markdown formatter with Noice
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    -- override the lsp markdown formatter with Noice
                    ["vim.lsp.util.stylize_markdown"] = true,
                    -- override cmp documentation with Noice (needs the other options to work)
                    ["cmp.entry.get_documentation"] = true,
                },
                hover = {
                    enabled = true,
                    view = nil, -- when nil, use defaults from documentation
                    ---@type NoiceViewOptions
                    opts = {}, -- merged with defaults from documentation
                },
                signature = {
                    enabled = true,
                    auto_open = {
                        enabled = true,
                        trigger = true, -- Automatically show signature help when typing a trigger character from the LSP
                        luasnip = true, -- Will open signature help when jumping to Luasnip insert nodes
                        throttle = 50, -- Debounce lsp signature help request by 50ms
                    },
                    view = nil, -- when nil, use defaults from documentation
                    ---@type NoiceViewOptions
                    opts = {}, -- merged with defaults from documentation
                },
                message = {
                    -- Messages shown by lsp servers
                    enabled = true,
                    view = "notify",
                    opts = {},
                },
                -- defaults for hover and signature help
                documentation = {
                    view = "hover",
                    ---@type NoiceViewOptions
                    opts = {
                        lang = "markdown",
                        replace = true,
                        render = "plain",
                        format = { "{message}" },
                        win_options = { concealcursor = "n", conceallevel = 3 },
                    },
                },
            },
            presets = {
                -- you can enable a preset by setting it to true, or a table that will override the preset config
                -- you can also add custom presets that you can enable/disable with enabled=true
                bottom_search = false, -- use a classic bottom cmdline for search
                command_palette = false, -- position the cmdline and popupmenu together
                long_message_to_split = true, -- long messages will be sent to a split
                inc_rename = true, -- enables an input dialog for inc-rename.nvim
                lsp_doc_border = true, -- add a border to hover docs and signature help
            },
        },
    },

    {
        "stevearc/dressing.nvim",
        lazy = true,
        init = function()
            ---@diagnostic disable-next-line: duplicate-set-field
            vim.ui.select = function(...)
                require("lazy").load({ plugins = { "dressing.nvim" } })
                return vim.ui.select(...)
            end
            ---@diagnostic disable-next-line: duplicate-set-field
            vim.ui.input = function(...)
                require("lazy").load({ plugins = { "dressing.nvim" } })
                return vim.ui.input(...)
            end
        end,
    },

    {
        "anuvyklack/windows.nvim",
        event = "VeryLazy",
        dependencies = {
            "anuvyklack/middleclass",
            "anuvyklack/animation.nvim",
        },
        opts = {
            autowidth = {
                enable = false,
                winwidth = 30,
                filetype = {
                    help = 2,
                },
            },
            ignore = {
                buftype = { "quickfix" },
                filetype = { "NvimTree", "neo-tree", "undotree", "gundo" },
            },
            animation = {
                enable = true,
                duration = 300,
                fps = 30,
                easing = "in_out_sine",
            },
        },
        config = function(_, opts)
            local windows = require("windows")

            vim.o.winwidth = 10
            vim.o.winminwidth = 10
            vim.o.equalalways = false
            windows.setup(opts)
        end,
    },

    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        opts = function()
            local join = Vin.lib.utils.join

            local hide_in_width = function()
                return vim.fn.winwidth(0) > 80
            end

            local mode = {
                function()
                    return Vin.icons.misc.Vim
                end,
                padding = 1,
            }

            local date = {
                function()
                    return os.date("%d.%m.%Y")
                end,
                padding = 1,
            }

            local time = {
                function()
                    return os.date("%H:%M:%S")
                end,
                padding = 1,
            }

            local project_name = {
                function()
                    local current_project_folder =
                        vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
                    local parent_project_folder =
                        vim.fn.fnamemodify(vim.fn.getcwd(), ":h:t")
                    return Vin.icons.documents.Folder
                        .. " "
                        .. parent_project_folder
                        .. "/"
                        .. current_project_folder
                end,
                padding = 2,
            }

            local last_commit_message = {
                function()
                    local f = io.popen("git log --pretty=%s -1")
                    if f then
                        local commit_message = f:read("*a")
                        f:close()
                        return commit_message
                    else
                        return ""
                    end
                end,
                padding = 2,
            }

            local client_name_to_icon_map = {
                copilot = Vin.icons.git.Octoface,
                cssls = Vin.icons.lang.Css,
                tsserver = Vin.icons.lang.TypeScript,
                sumneko_lua = Vin.icons.lang.Lua,
                jsonls = Vin.icons.lang.JSON,
                html = Vin.icons.lang.Html,
                marksman = Vin.icons.lang.Markdown,
                eslint = " ",
                ["null-ls"] = " ",
            }

            local lsp_clients = {
                function()
                    local lsp_client_list = {}

                    -- get all active lsp clients for current buffer
                    local current_bufnr = vim.api.nvim_get_current_buf()
                    local active_clients_for_current_buffer =
                        vim.lsp.get_active_clients({
                            bufnr = current_bufnr,
                        })

                    -- gather all active clients
                    for _, client in pairs(active_clients_for_current_buffer) do
                        local client_name = client.name
                        table.insert(lsp_client_list, client_name)
                    end

                    -- if copilot is found in the lsp_client_list put it as the first elements in the lsp_client_list
                    for i, client in pairs(lsp_client_list) do
                        if client:find("copilot") then
                            table.remove(lsp_client_list, i)
                            table.insert(lsp_client_list, 1, client)
                        end
                    end

                    -- add icon from client_name_to_icon_map to each entry of the lsp_client_list
                    for i, client_name in pairs(lsp_client_list) do
                        local client_icon = join(
                            client_name_to_icon_map[client_name],
                            " "
                        ) or ""
                        lsp_client_list[i] = client_icon .. client_name
                    end

                    -- if lsp_client_list is empty return empty strings
                    if vim.tbl_isempty(lsp_client_list) then
                        return ""
                    else
                        return join("[", table.concat(lsp_client_list, ", "), "]")
                    end
                end,
                padding = 2,
                cond = hide_in_width,
                on_click = function()
                    vim.cmd("LspInfo")
                end,
            }

            local branch = {
                "branch",
                padding = 2,
            }

            local diff = {
                "diff",
                colored = true, -- Displays a colored diff status if set to true
                diff_color = {
                    -- Same color values as the general color option can be used here.
                    added = "DiffAdd", -- Changes the diff's added color
                    modified = "DiffChange", -- Changes the diff's modified color
                    removed = "DiffDelete", -- Changes the diff's removed color you
                },
                symbols = { added = " ", modified = " ", removed = " " }, -- Changes the symbols used by the diff.
                cond = hide_in_width,
            }

            local filetype_icon = {
                "filetype",
                colored = true, -- Displays filetype icon in color if set to true
                icon_only = true, -- Display only an icon for filetype
                padding = 1,
            }

            local filename = {
                "filename",
                file_status = true, -- Displays file status (readonly status, modified status)
                newfile_status = false, -- Display new file status (new file means no write after created)
                path = 1, -- 0: Just the filename
                -- 1: Relative path
                -- 2: Absolute path
                -- 3: Absolute path, with tilde as the home directory

                shorting_target = 10, -- Shortens path to leave 40 spaces in the window
                -- for other components. (terrible name, any suggestions?)
                symbols = {
                    modified = "[+]", -- Text to show when the file is modified.
                    readonly = "[-]", -- Text to show when the file is non-modifiable or readonly.
                    unnamed = "[No Name]", -- Text to show for unnamed buffers.
                    newfile = "[New]", -- Text to show for new created file before first writting
                },
            }

            local tabs = {
                "tabs",
                max_length = 20, -- Maximum width of tabs component.
                mode = 0, -- 0: Shows tab_nr 1: Shows tab_name 2: Shows tab_nr + tab_name
                padding = 1,
            }

            return {
                options = {
                    globalstatus = true,
                    icons_enabled = true,
                    theme = "auto",
                    -- section_separators = { left = "", right = "" },
                    -- component_separators = { left = "", right = "" },
                    -- section_separators = { left = "", right = "" },
                    -- component_separators = { left = "", right = "" },
                    -- section_separators = { left = "", right = "" },
                    -- component_separators = { left = "", right = "" },
                    section_separators = { left = "", right = "" },
                    component_separators = { left = "", right = "" },
                    disabled_filetypes = {
                        statusline = {
                            "alpha",
                        },
                        winbar = {
                            "alpha",
                            "NvimTree",
                            "neo-tree",
                            "",
                        },
                    },
                    always_divide_middle = true,
                    refresh = {
                        statusline = 1000,
                        tabline = 1000,
                        winbar = 1000,
                    },
                },
                tabline = {},
                winbar = {
                    lualine_a = {},
                    lualine_b = { filetype_icon, filename },
                    lualine_c = {},
                    lualine_x = { lsp_clients, diff, "diagnostics" },
                    lualine_y = {},
                    lualine_z = {},
                },
                inactive_winbar = {
                    lualine_a = {},
                    lualine_b = { filetype_icon, filename },
                    lualine_c = {},
                    lualine_x = {},
                    lualine_y = {},
                    lualine_z = {},
                },
                sections = {
                    lualine_a = { mode },
                    lualine_b = { project_name, branch },
                    lualine_c = { date, time },
                    lualine_z = { tabs },
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = {},
                    lualine_x = {},
                    lualine_y = {},
                    lualine_z = {},
                },
                extensions = {},
            }
        end,
    },

    {
        "goolord/alpha-nvim",
        event = "VimEnter",
        dependencies = { "kyazdani42/nvim-web-devicons" },
        opts = function()
            local dashboard = require("alpha.themes.dashboard")
            local logo = [[
      ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          Z
      ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      Z    
      ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z       
      ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z         
      ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║
      ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝
      ]]

            dashboard.section.header.val = vim.split(logo, "\n")
            dashboard.section.buttons.val = {
                dashboard.button(
                    "f",
                    " " .. " Find file",
                    ":Telescope find_files <CR>"
                ),
                dashboard.button(
                    "n",
                    " " .. " New file",
                    ":ene <BAR> startinsert <CR>"
                ),
                dashboard.button(
                    "r",
                    " " .. " Recent files",
                    ":Telescope oldfiles <CR>"
                ),
                dashboard.button(
                    "g",
                    " " .. " Find text",
                    ":Telescope live_grep <CR>"
                ),
                dashboard.button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
                dashboard.button(
                    "s",
                    "勒" .. " Restore Session",
                    [[:lua require("persistence").load() <cr>]]
                ),
                dashboard.button("l", "鈴" .. " Lazy", ":Lazy<CR>"),
                dashboard.button("q", " " .. " Quit", ":qa<CR>"),
            }
            for _, button in ipairs(dashboard.section.buttons.val) do
                button.opts.hl = "AlphaButtons"
                button.opts.hl_shortcut = "AlphaShortcut"
            end
            dashboard.section.footer.opts.hl = "Type"
            dashboard.section.header.opts.hl = "AlphaHeader"
            dashboard.section.buttons.opts.hl = "AlphaButtons"
            dashboard.opts.layout[1].val = 8
            return dashboard
        end,
        config = function(_, dashboard)
            vim.b.miniindentscope_disable = true

            -- close Lazy and re-open when the dashboard is ready
            if vim.o.filetype == "lazy" then
                vim.cmd.close()
                vim.api.nvim_create_autocmd("User", {
                    pattern = "AlphaReady",
                    callback = function()
                        require("lazy").show()
                    end,
                })
            end

            require("alpha").setup(dashboard.opts)

            vim.api.nvim_create_autocmd("User", {
                pattern = "LazyVimStarted",
                callback = function()
                    local stats = require("lazy").stats()
                    local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                    dashboard.section.footer.val = "⚡ Neovim loaded "
                        .. stats.count
                        .. " plugins in "
                        .. ms
                        .. "ms"
                    pcall(vim.cmd.AlphaRedraw)
                end,
            })
        end,
    },

    {
        "numToStr/FTerm.nvim",
        opts = {
            border = "single",
            dimensions = {
                height = 0.9,
                width = 0.9,
            },
        },
        config = function(_, opts)
            local fterm = require("FTerm")
            fterm.setup(opts)
        end,
    },
}
