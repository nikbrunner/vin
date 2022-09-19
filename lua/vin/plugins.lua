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
})

-- Install your plugins here
return packer.startup(function(use) -- My plugins here
    use({
        -- INFO: Have packer manage itself
        "wbthomason/packer.nvim",
        commit = "afab89594f4f702dc3368769c95b782dbdaeaf0a",
    })

    use({ "antoinemadec/FixCursorHold.nvim" })

    -- Libs for Utility and general Improvements
    use({
        -- INFO: An implementation of the Popup API from vim in Neovim
        -- TODO: Check if needed
        "nvim-lua/popup.nvim",
        commit = "b7404d35d5d3548a82149238289fa71f7f6de4ac",
    })

    use({
        -- INFO: Useful lua functions used ny lots of plugins
        "nvim-lua/plenary.nvim",
        commit = "31807eef4ed574854b8a53ae40ea3292033a78ea",
    })

    use({
        -- INFO: Stay
        "lewis6991/impatient.nvim",
        commit = "4ccbe749ce439fa25d387d459e8c339131cc5d1f",
    })

    use({
        -- INFO: color Pigments of color codes
        "NvChad/nvim-colorizer.lua",
        commit = "004a2b3ef62b01d3d1db454d1efe76d31934d43b",
    })

    -- LSP
    use({
        -- INFO: Configs for native LSP
        "neovim/nvim-lspconfig",
        commit = "a78831f97564b4344953ce1ba0f53fc5d034472d",
    })

    use({
        -- INFO: VSCode Like Pictograms for LSP Iitems
        -- TODO: Own RC File
        "onsails/lspkind-nvim",
        commmit = "57e5b5dfbe991151b07d272a06e365a77cc3d0e7",
    })

    use({
        "williamboman/mason.nvim",
        commit = "cb7bdcd2d5a71ffb12127d60bcaad5ba39ab741b",
    })

    use({
        "williamboman/mason-lspconfig.nvim",
        commit = "f0d0d62273b76fa0ef5154ce9d05b1a2a083e79b",
    })

    use({
        -- INFO: language server settings defined in json
        "tamago324/nlsp-settings.nvim",
        commit = "1de2ad10b78e229c03106b38c954dd266bc49d42",
    })

    use({
        -- INFO: for formatters and linters
        "jose-elias-alvarez/null-ls.nvim",
        commit = "5b745e5fa2a18a2c0df8966080f4321fad4f42d7",
    })

    use({
        -- INFO: for parameter hints
        -- TODO: Check if needed
        "ray-x/lsp_signature.nvim",
        commit = "4665921ff8e30601c7c1328625b3abc1427a6143",
    })

    use({
        -- INFO: for LSP progress
        "j-hui/fidget.nvim",
        commit = "492492e7d50452a9ace8346d31f6d6da40439f0e",
    })

    use({
        -- INFO: Tool Package for LSP
        "glepnir/lspsaga.nvim",
        branch = "main",
        commit = "c2ef0115fb917460daf5c76fe3ad3a9357213b54",
    })

    use({
        -- INFO: Lua Development
        -- TODO: Check if needed
        "folke/lua-dev.nvim",
        commit = "f5c31936fe06fcbeb59b98f69f74f9c2f91abaec",
    })

    -- UI Enhancements
    use({
        -- INFO: Style up basic neovim components
        "stevearc/dressing.nvim",
        commit = "d886a1bb0b43a81af58e0331fedbe8b02ac414fa",
    })

    use({
        -- INFO: Pretty Icons
        "kyazdani42/nvim-web-devicons",
        commit = "2d02a56189e2bde11edd4712fea16f08a6656944",
    })

    use({
        "kyazdani42/nvim-tree.lua",
        requires = {
            "kyazdani42/nvim-web-devicons", -- optional, for file icons
        },
        commit = "09a51266bca28dd87febd63c66bdbd74f7764a63",
    })

    -- using packer.nvim
    use({
        "akinsho/bufferline.nvim",
        tag = "v2.*",
        requires = "kyazdani42/nvim-web-devicons",
        commit = "2e5d92efacf40d488c4647a9e3e5100357b184cf",
    })

    use({
        -- INFO: Status Line
        "nvim-lualine/lualine.nvim",
        commit = "03bcf015d1131b64e13e97344e8f456f2af4e60d",
    })

    use({
        -- INFO: Starting screen
        "goolord/alpha-nvim",
        commit = "d688f46090a582be8f9d7b70b4cf999b780e993d",
    })

    use({
        -- INFO: Organizied Mappings
        "folke/which-key.nvim",
        commit = "bd4411a2ed4dd8bb69c125e339d837028a6eea71",
    })

    -- Completion
    use({
        -- INFO: The completion engine
        "hrsh7th/nvim-cmp",
        commit = "706371f1300e7c0acb98b346f80dad2dd9b5f679",
    })

    use({
        -- INFO: Completion for LSP items
        "hrsh7th/cmp-nvim-lsp",
        commit = "affe808a5c56b71630f17aa7c38e15c59fd648a8",
    })

    use({
        -- INFO: Completions for words in Buffer
        "hrsh7th/cmp-buffer",
        commit = "62fc67a2b0205136bc3e312664624ba2ab4a9323",
    })

    use({
        -- INFO: Completions for Path
        "hrsh7th/cmp-path",
        commit = "447c87cdd6e6d6a1d2488b1d43108bfa217f56e1",
    })

    use({
        -- INFO: snippet completions
        "saadparwaiz1/cmp_luasnip",
        commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36",
    })

    -- snippets
    use({
        -- INFO: Snippet Engine. This is indirectly needed for CMP
        "L3MON4D3/LuaSnip",
        commit = "c599c560ed26f04f5bdb7e4498b632dc16fb9209",
    })

    use({
        -- INFO: a bunch of snippets to use
        -- INFO: See snippets for react here: https://github.com/rafamadriz/friendly-snippets/blob/main/snippets/javascript/react-ts.json
        "rafamadriz/friendly-snippets",
        commit = "7339def34e46237eb7c9a893cb7d42dcb90e05e6",
    })

    -- INFO: Colorschemes
    use({
        -- INFO: My Theme :)
        "~/Documents/dev/repos/personal/terra-theme/nvim",
        -- 	"terra-theme/nvim",
        -- 	commit = "16f6c24be96c2d26214dc01d9e166d8e150dffdc",
    })

    use({
        -- INFO: GitHub Theme
        "projekt0n/github-nvim-theme",
        commit = "b3f15193d1733cc4e9c9fe65fbfec329af4bdc2a",
    })

    -- INFO: Fuzzy finding
    use({
        -- INFO: Flexible fuzzy finder
        "nvim-telescope/telescope.nvim",
        commit = "4725867ec66b9a0f5e5ad95a1fd94c2f97fa2d2c",
    })

    use({
        -- INFO: Extension to search through GitHub related files
        -- TODO: Fix my own implementation
        "nvim-telescope/telescope-github.nvim",
        commit = "ee95c509901c3357679e9f2f9eaac3561c811736",
    })

    use({
        "nvim-telescope/telescope-file-browser.nvim",
        commit = "4272c52078cc457dfaabce6fa3545e7495651d04",
    })

    use({
        "nvim-telescope/telescope-project.nvim",
        commit = "dc9a1977d159e3feb98774729f5c30584e2b700a",
    })

    -- INFO: Treesitter
    use({
        -- INFO: Abstract Syntax Tree (AST), which helps with Syntax Highliting, Code and Code Analysation
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        commit = "7e410054235ea84c817fc2b93f8df359ba6545eb",
    })

    use({
        -- INFO: Treesitter Playground to show the current AST
        "nvim-treesitter/playground",
        run = ":TSInstall query",
        commit = "ce7e4b757598f1c785ed0fd94fc65959acd7d39c",
    })

    use({
        -- INFO: Bar at the top which, shows the current scope
        "nvim-treesitter/nvim-treesitter-context",
        commit = "8e88b67d0dc386d6ba1b3d09c206f19a50bc0625",
    })

    use({
        -- INFO: Better comments which helps in templates files like React etc
        "JoosepAlviste/nvim-ts-context-commentstring",
        commit = "7d0b001cd6ec2adc25b8d81496c5ef3bd188f781",
    })

    -- Git
    use({
        -- INFO: Various tools around Git
        "lewis6991/gitsigns.nvim",
        commit = "9c3ca027661136a618c82275427746e481c84a4e",
    })

    use({

        "sindrets/diffview.nvim",
        requires = "nvim-lua/plenary.nvim",
        commit = "a45163cb9ee65742cf26b940c2b24cc652f295c9",
    })

    use({
        -- INFO: Autopairs for Brackets, integrates with both cmp and treesitter
        "windwp/nvim-autopairs",
        commit = "ca89ab9e7e42aa9279f1cdad15398d6e18ccee86",
    })

    use({
        -- INFO: Automatically closes tags
        "windwp/nvim-ts-autotag",
        commit = "044a05c4c51051326900a53ba98fddacd15fea22",
    })

    use({
        -- INFO: Easily comment stuff
        "numToStr/Comment.nvim",
        commit = "fe9bbdbcd2f1b85cc8fccead68122873d94f8397",
    })

    use({
        -- INFO: Tools for closing buffers
        "kazhala/close-buffers.nvim",
        commit = "3acbcad1211572342632a6c0151f839e7dead27f",
    })

    use({
        -- INFO: Focus a window with a shortcut
        "s1n7ax/nvim-window-picker",
        tag = "v1.*",
        commit = "7557ec199efdd979a838a721494aa83749ea37fe",
    })

    use({
        -- INFO: Highlight all occurences of current word under cursor
        -- TODO: Check if needed
        "RRethy/vim-illuminate",
        commit = "6bfa5dc069bd4aa8513a3640d0b73392094749be",
    })

    use({
        -- INFO: Code Navigation. Enables cib for example
        -- TODO: Research deeper
        "wellle/targets.vim",
        commit = "8d6ff2984cdfaebe5b7a6eee8f226a6dd1226f2d",
    })

    use({
        -- INFO: Hotkey files
        "ThePrimeagen/harpoon",
        commit = "d3d3d22b6207f46f8ca64946f4d781e975aec0fc",
    })

    use({
        -- INFO: Improvements for the QF List
        "kevinhwang91/nvim-bqf",
        ft = "qf",
        commit = "8b62211ad7529c314e80b22968eef6ba275c781c",
    })

    use({
        -- INFO: Prettier Notifications for nvim
        "rcarriga/nvim-notify",
        commit = "60bb6bfd6992549ee5336bbb761705b62797ce1d",
    })

    use({
        -- INFO: Zen Mode
        "folke/zen-mode.nvim",
        commit = "f1cc53d32b49cf962fb89a2eb0a31b85bb270f7c",
    })

    use({
        -- INFO: Display all todos in a pretty way
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        commit = "98b1ebf198836bdc226c0562b9f906584e6c400e",
    })

    use({
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        commit = "da61737d860ddc12f78e638152834487eabf0ee5",
    })

    use({
        -- INFO: Automatically sets the indent by analysing the first 100 lines of the file
        "nmac427/guess-indent.nvim",
        commit = "c37467baa1a51b74ed767cbe0540fce44e03d828",
    })

    use({
        -- INFO: Lazygit for Neovim :)
        "kdheepak/lazygit.nvim",
        commit = "9c73fd69a4c1cb3b3fc35b741ac968e331642600",
    })

    use({
        -- INFO: Prettier folds
        -- TODO: Check if needed
        "anuvyklack/pretty-fold.nvim",
        requires = {
            "anuvyklack/fold-preview.nvim",
            "anuvyklack/keymap-amend.nvim",
        },
        commit = "a7d8b424abe0eedf50116c460fbe6dfd5783b1d5",
    })

    use({
        -- INFO: Shifting lines
        -- TODO: Check if needed
        "booperlv/nvim-gomove",
        commit = "2b44ae7ac0804f4e3959228122f7c85bef1964e3",
    })

    use({
        -- INFO: Preview Markdown Files
        -- TODO: Replace with https://github.com/iamcco/markdown-preview.nvim
        "davidgranstrom/nvim-markdown-preview",
        commit = "3d6f941beb223b23122973d077522e9e2ee33068",
    })

    use({
        -- INFO: Speedy Code Navigation
        "phaazon/hop.nvim",
        branch = "v2",
        commit = "2a1b686aad85a3c241f8cd8fd42eb09c7de5ed79",
    })

    use({ "b0o/incline.nvim", commit = "44d4e6f4dcf2f98cf7b62a14e3c10749fc5c6e35" })

    use({
        "uga-rosa/ccc.nvim",
        branch = "0.7.2",
        commit = "2d88adb8cd2728fc591e21fc423123a2c2958b95",
    })

    use({
        "kylechui/nvim-surround",
        tag = "*",
        commit = "d91787d5a716623be7cec3be23c06c0856dc21b8",
    })

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        packer.sync()
    end
end)
