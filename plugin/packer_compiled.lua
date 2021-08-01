-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/nibru/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/nibru/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/nibru/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/nibru/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/nibru/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["ack.vim"] = {
    loaded = true,
    path = "/Users/nibru/.local/share/nvim/site/pack/packer/start/ack.vim"
  },
  ["barbar.nvim"] = {
    loaded = true,
    path = "/Users/nibru/.local/share/nvim/site/pack/packer/start/barbar.nvim"
  },
  ["dashboard-nvim"] = {
    loaded = true,
    path = "/Users/nibru/.local/share/nvim/site/pack/packer/start/dashboard-nvim"
  },
  ["diffview.nvim"] = {
    loaded = true,
    path = "/Users/nibru/.local/share/nvim/site/pack/packer/start/diffview.nvim"
  },
  ["formatter.nvim"] = {
    loaded = true,
    path = "/Users/nibru/.local/share/nvim/site/pack/packer/start/formatter.nvim"
  },
  ["galaxyline.nvim"] = {
    loaded = true,
    path = "/Users/nibru/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  ["github-nvim-theme"] = {
    loaded = true,
    path = "/Users/nibru/.local/share/nvim/site/pack/packer/start/github-nvim-theme"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/Users/nibru/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["lazygit.nvim"] = {
    loaded = true,
    path = "/Users/nibru/.local/share/nvim/site/pack/packer/start/lazygit.nvim"
  },
  ["lsp-trouble.nvim"] = {
    loaded = true,
    path = "/Users/nibru/.local/share/nvim/site/pack/packer/start/lsp-trouble.nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/Users/nibru/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/Users/nibru/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-bqf"] = {
    loaded = true,
    path = "/Users/nibru/.local/share/nvim/site/pack/packer/start/nvim-bqf"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/Users/nibru/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/Users/nibru/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/nibru/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-peekup"] = {
    loaded = true,
    path = "/Users/nibru/.local/share/nvim/site/pack/packer/start/nvim-peekup"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/Users/nibru/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/nibru/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-ts-autotag"] = {
    loaded = true,
    path = "/Users/nibru/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/nibru/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/nibru/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/nibru/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["rooter.nvim"] = {
    loaded = true,
    path = "/Users/nibru/.local/share/nvim/site/pack/packer/start/rooter.nvim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/Users/nibru/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/nibru/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ultisnips = {
    loaded = true,
    path = "/Users/nibru/.local/share/nvim/site/pack/packer/start/ultisnips"
  },
  ["vim-autoread"] = {
    loaded = true,
    path = "/Users/nibru/.local/share/nvim/site/pack/packer/start/vim-autoread"
  },
  ["vim-bookmarks"] = {
    loaded = true,
    path = "/Users/nibru/.local/share/nvim/site/pack/packer/start/vim-bookmarks"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/nibru/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/Users/nibru/.local/share/nvim/site/pack/packer/start/vim-devicons"
  },
  ["vim-highlightedyank"] = {
    loaded = true,
    path = "/Users/nibru/.local/share/nvim/site/pack/packer/start/vim-highlightedyank"
  },
  ["vim-illuminate"] = {
    loaded = true,
    path = "/Users/nibru/.local/share/nvim/site/pack/packer/start/vim-illuminate"
  },
  ["vim-prettier"] = {
    loaded = true,
    path = "/Users/nibru/.local/share/nvim/site/pack/packer/start/vim-prettier"
  },
  ["vim-react-snippets"] = {
    loaded = true,
    path = "/Users/nibru/.local/share/nvim/site/pack/packer/start/vim-react-snippets"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/nibru/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-visual-multi"] = {
    loaded = true,
    path = "/Users/nibru/.local/share/nvim/site/pack/packer/start/vim-visual-multi"
  },
  ["vim-wordmotion"] = {
    loaded = true,
    path = "/Users/nibru/.local/share/nvim/site/pack/packer/start/vim-wordmotion"
  },
  ["zen-mode.nvim"] = {
    loaded = true,
    path = "/Users/nibru/.local/share/nvim/site/pack/packer/start/zen-mode.nvim"
  }
}

time([[Defining packer_plugins]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
