local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    print(
        "Hi, my name is Vin! Please take a seat, I'm installing packer for you and get you set up!"
    )
    vim.cmd([[packadd packer.nvim]])
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
-- This is also the place for any other packer settings
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
    git = {
        subcommands = { -- Format strings for git subcommands
            update = "pull --ff-only --progress --rebase=true",
        },
    },
    -- NOTE: Limiting the max jobs helps when packer gets stuck on "checking current commit"
    max_jobs = 15, -- Limit the number of simultaneous jobs. nil means no limit
    auto_clean = true, -- During sync(), remove unused plugins
    compile_on_sync = true, -- During sync(), run packer.compile()
    ensure_dependencies   = true, -- Should packer install plugin dependencies?
    preview_updates = true
})

-- Install your plugins here
return packer.startup(function(use) -- My plugins here
    -- INFO: Have the package-manager manage itself
    use({
        "wbthomason/packer.nvim",
        commit = "6afb67460283f0e990d35d229fd38fdc04063e0a",
    })

    -- INFO: An implementation of the Popup API from vim in Neovim
    use({
        "nvim-lua/popup.nvim",
        commit = "b7404d35d5d3548a82149238289fa71f7f6de4ac",
    })

    -- INFO: Useful lua functions used ny lots of plugins
    use({
        "nvim-lua/plenary.nvim",
        commit = "4b7e52044bbb84242158d977a50c4cbcd85070c7",
    })

    -- INFO: Cache Modules for faster startups
    use({
        "lewis6991/impatient.nvim",
        commit = "b842e16ecc1a700f62adb9802f8355b99b52a5a6",
    })

    -- INFO: Configs for native LSP
    use({
        "neovim/nvim-lspconfig",
        commit = "f11fdff7e8b5b415e5ef1837bdcdd37ea6764dda",
    })

    -- INFO: VSCode Like Pictograms for LSP Iitems
    use({
        "onsails/lspkind-nvim",
        commmit = "c68b3a003483cf382428a43035079f78474cd11e",
    })

    -- INFO: LSP Installation GUI and Helper
    use({
        "williamboman/mason.nvim",
        commit = "c2002d7a6b5a72ba02388548cfaf420b864fbc12",
    })

    -- INFO: Bridge for Mason to nvim-lspconfig
    use({
        "williamboman/mason-lspconfig.nvim",
        commit = "0051870dd728f4988110a1b2d47f4a4510213e31",
    })

    -- INFO: Language Server Settings defined in json (e.g. tsconfig)
    use({
        "tamago324/nlsp-settings.nvim",
        commit = "8556dea892c60e9a36f0fba358c7fda8f492ad15",
    })

    -- INFO: For formatters and linters
    use({
        "jose-elias-alvarez/null-ls.nvim",
        commit = "c0c19f32b614b3921e17886c541c13a72748d450",
    })

    -- INFO: for parameter hints
    use({
        "ray-x/lsp_signature.nvim",
        commit = "e65a63858771db3f086c8d904ff5f80705fd962b",
    })

    -- INFO: Tool Package for LSP
    use({
        "glepnir/lspsaga.nvim",
        branch = "main",
        commit = "0c09e7c620f473275d7643f9d10a405e078c9f16",
    })

    -- INFO: Lua Development
    use({
        "folke/lua-dev.nvim",
        commit = "c8139fc35029c81f39c4e60732f24d231c0ac78e",
    })

    -- INFO: Style up basic neovim components
    use({
        "stevearc/dressing.nvim",
        commit = "76477792b34f8fed167b5aa61a325e4dab26c3d7",
    })

    -- INFO: Pretty Icons
    use({
        "kyazdani42/nvim-web-devicons",
        commit = "563f3635c2d8a7be7933b9e547f7c178ba0d4352",
    })

    -- INFO: File Tree
    use({
        "kyazdani42/nvim-tree.lua",
        requires = "kyazdani42/nvim-web-devicons", -- optional, for file icons
        commit = "7282f7de8aedf861fe0162a559fc2b214383c51c",
    })

    -- INFO: Statusline, Tabline, Winbar
    use({
        "nvim-lualine/lualine.nvim",
        commit = "a52f078026b27694d2290e34efa61a6e4a690621",
    })

    -- INFO: Starting screen
    use({
        "goolord/alpha-nvim",
        commit = "0bb6fc0646bcd1cdb4639737a1cee8d6e08bcc31",
    })

    -- INFO: Organizied Mappings
    use({
        "folke/which-key.nvim",
        commit = "6885b669523ff4238de99a7c653d47b081b5506d",
    })

    -- INFO: Snippet Engine. This is indirectly needed for CMP
    use({
        "L3MON4D3/LuaSnip",
        commit = "8f8d493e7836f2697df878ef9c128337cbf2bb84",
        requires = {
            {
                -- A bunch of snippets to use (https://github.com/rafamadriz/friendly-snippets/blob/main/snippets/javascript/react-ts.json)
                "rafamadriz/friendly-snippets",
                commit = "2be79d8a9b03d4175ba6b3d14b082680de1b31b1",
            },
        },
    })

    -- INFO: The completion engine
    use({
        "hrsh7th/nvim-cmp",
        commit = "b0dff0ec4f2748626aae13f011d1a47071fe9abc",
        requires = {
            {
                -- Completion for LSP items
                "hrsh7th/cmp-nvim-lsp",
                commit = "affe808a5c56b71630f17aa7c38e15c59fd648a8",
            },
            {
                -- Completions for words in Buffer
                "hrsh7th/cmp-buffer",
                commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa",
            },

            {
                -- Completions for Path
                "hrsh7th/cmp-path",
                commit = "91ff86cd9c29299a64f968ebb45846c485725f23",
            },
            {
                -- Snippet completions
                "saadparwaiz1/cmp_luasnip",
                commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36",
            },
        },
    })

    use({
        "~/Documents/dev/repos/personal/terra-theme/nvim",
        -- 	"terra-theme/nvim",
    })

    -- INFO: GitHub Theme
    use({
        "projekt0n/github-nvim-theme",
        commit = "b3f15193d1733cc4e9c9fe65fbfec329af4bdc2a",
    })

    -- INFO: Flexible fuzzy finder
    use({
        "nvim-telescope/telescope.nvim",
        commit = "76ea9a898d3307244dce3573392dcf2cc38f340f",
    })

    -- INFO: Extension to search through GitHub related files
    use({
        "nvim-telescope/telescope-github.nvim",
        commit = "ee95c509901c3357679e9f2f9eaac3561c811736",
        requires = "nvim-telescope/telescope.nvim",
    })

    use({
        "nvim-telescope/telescope-project.nvim",
        commit = "a0dec67decbc85cf1af2002807c8a963f72c1d13",
        requires = "nvim-telescope/telescope.nvim",
    })

    -- INFO: Abstract Syntax Tree (AST), which helps with Syntax Highliting, Code and Code Analysation
    use({
        "nvim-treesitter/nvim-treesitter",
        commit = "7ccb9a056fa43da243e3a439109c354c551c51b6",
        run = ":TSUpdate",
    })

    -- INFO: Treesitter Playground to show the current AST
    use({
        "nvim-treesitter/playground",
        commit = "e6a0bfaf9b5e36e3a327a1ae9a44a989eae472cf",
        requires = "nvim-treesitter/nvim-treesitter",
        after = "nvim-treesitter",
        run = ":TSInstall query",
    })

    -- INFO: Bar at the top which, shows the current scope
    use({
        "nvim-treesitter/nvim-treesitter-context",
        commit = "8d0759eb798fee2e1201b26c3279713ac67c44c2",
        requires = "nvim-treesitter/nvim-treesitter",
        after = "nvim-treesitter",
    })

    -- INFO: Better comments which helps in templates files like React etc
    use({
        "JoosepAlviste/nvim-ts-context-commentstring",
        commit = "4d3a68c41a53add8804f471fcc49bb398fe8de08",
        requires = "nvim-treesitter/nvim-treesitter",
        after = "nvim-treesitter",
    })

    -- INFO: Autopairs for Brackets, integrates with both cmp and treesitter
    use({
        "windwp/nvim-autopairs",
        commit = "4fc96c8f3df89b6d23e5092d31c866c53a346347",
        requires = "nvim-treesitter/nvim-treesitter",
        after = "nvim-treesitter",
    })

    use({
        -- INFO: Automatically closes tags
        "windwp/nvim-ts-autotag",
        commit = "fdefe46c6807441460f11f11a167a2baf8e4534b",
        requires = "nvim-treesitter/nvim-treesitter",
        after = "nvim-treesitter",
    })

    -- INFO: Various tools around Git
    use({
        "lewis6991/gitsigns.nvim",
        commit = "231fa923fbc2797eef92b24860ab882cebf645b2",
    })

    -- INFO: Git Tool to help with checking diffs
    use({
        "sindrets/diffview.nvim",
        commit = "6baa30d0a6f63da254c2d2c0638a426166973976",
        requires = "nvim-lua/plenary.nvim",
    })

    -- INFO: Easily comment stuff
    use({
        "numToStr/Comment.nvim",
        commit = "97a188a98b5a3a6f9b1b850799ac078faa17ab67",
    })

    -- INFO: Tools for closing buffers
    use({
        "kazhala/close-buffers.nvim",
        commit = "3acbcad1211572342632a6c0151f839e7dead27f",
    })

    -- INFO: Focus a window with a shortcut
    use({
        "s1n7ax/nvim-window-picker",
        tag = "v1.*",
        commit = "7557ec199efdd979a838a721494aa83749ea37fe",
    })

    -- INFO: Highlight all occurences of current word under cursor
    use({
        "RRethy/vim-illuminate",
        commit = "a2e8476af3f3e993bb0d6477438aad3096512e42",
    })

    -- INFO: Code Navigation. Enables cib for example
    -- TODO: Research deeper
    use({
        "wellle/targets.vim",
        commit = "8d6ff2984cdfaebe5b7a6eee8f226a6dd1226f2d",
    })

    -- INFO: Hotkey files
    use({
        "ThePrimeagen/harpoon",
        commit = "f4aff5bf9b512f5a85fe20eb1dcf4a87e512d971",
    })

    -- INFO: Improvements for the QF List
    use({
        "kevinhwang91/nvim-bqf",
        ft = "qf",
        commit = "aea31569d1b20aa6a35fa84ec756cb205a4a7134",
    })

    -- INFO: Prettier Notifications for nvim
    use({
        "rcarriga/nvim-notify",
        commit = "414465468c93f693be4e2f69f47586cf37f3f751",
    })

    -- INFO: Zen Mode
    use({
        "folke/zen-mode.nvim",
        commit = "6f5702db4fd4a4c9a212f8de3b7b982f3d93b03c",
    })

    -- INFO: Display all todos in a pretty way
    use({
        "folke/todo-comments.nvim",
        commit = "8df75dbb9ddd78a378b9661f25f0b193f38f06dd",
        requires = "nvim-lua/plenary.nvim",
    })

    -- INFO: LSP Problems View
    use({
        "folke/trouble.nvim",
        commit = "929315ea5f146f1ce0e784c76c943ece6f36d786",
        requires = "kyazdani42/nvim-web-devicons",
    })

    -- INFO: Automatically sets the indent by analysing the first 100 lines of the file
    use({
        "nmac427/guess-indent.nvim",
        commit = "c37467baa1a51b74ed767cbe0540fce44e03d828",
    })

    -- INFO: Lazygit inside Neovim :)
    use({
        "kdheepak/lazygit.nvim",
        commit = "9c73fd69a4c1cb3b3fc35b741ac968e331642600",
    })

    -- INFO: Prettier folds
    use({
        "anuvyklack/pretty-fold.nvim",
        commit = "a7d8b424abe0eedf50116c460fbe6dfd5783b1d5",
        requires = {
            "anuvyklack/fold-preview.nvim",
            "anuvyklack/keymap-amend.nvim",
        },
    })

    -- INFO: Preview Markdown Files
    use({
        "davidgranstrom/nvim-markdown-preview",
        commit = "3d6f941beb223b23122973d077522e9e2ee33068",
    })

    -- INFO: Preview and edit colors
    use({
        "uga-rosa/ccc.nvim",
        commit = "c403c7578428868d540e99b2978800f574444328",
    })

    -- INFO: Surround text actions
    use({
        "kylechui/nvim-surround",
        commit = "17191679202978b1de8c1bd5d975400897b1b92d",
        tag = "*",
    })

    -- INFO: Clipboard manager
    use({
        "AckslD/nvim-neoclip.lua",
        commit = "73fd2494b181cdad5dca2be23bfefd6e34621fd2",
    })

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        packer.sync()
    end
end)
