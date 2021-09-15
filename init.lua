-- Bootstraping Packer if not already installed
-- https://github.com/wbthomason/packer.nvim#bootstrapping
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd 'packadd packer.nvim'
end

-- plugins
require("plugins");

-- internal config
require("autocmd");
require("maps");
require("opts");

-- lsp
require("lsp/bash")
require("lsp/css")
require("lsp/ts")

-- plug-config
require("plug-config/autopairs");
require("plug-config/colorizer");
require("plug-config/cmp");
require("plug-config/kind");
require("plug-config/dashboard");
require("plug-config/formatter");
require("plug-config/galaxyline");
require("plug-config/gitsigns");
require("plug-config/highlightedyank");
require("plug-config/lazygit");
require("plug-config/lspsaga")
require("plug-config/nvimtree");
require("plug-config/rooter");
require("plug-config/telescope");
require("plug-config/treesitter");
require("plug-config/trouble");
require("plug-config/zen-mode");
require("plug-config/which-key");
require("plug-config/projects");

-- themes
-- require("plug-config/github-nvim");
require("plug-config/tokyonight");
