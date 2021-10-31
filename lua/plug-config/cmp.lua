local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup {
  completion = {
    completeopt = "menu,menuone,noinsert"
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },
  mapping = {
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true
    },
    ["<TAB>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true
    }
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "path" },
    { name = "nvim_lua" },
    { name = "buffer" },
    { name = "calc" },
    { name = "emoji" },
    { name = "treesitter" }
  },
  formatting = {
    format = function(entry, vim_item)
      -- fancy icons and a name of kind
      vim_item.kind =
          require("lspkind").presets.default[vim_item.kind] .. " " ..
              vim_item.kind

      -- set a name for each source
      vim_item.menu = ({
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        luasnip = "[LuaSnip]",
        nvim_lua = "[Lua]",
        latex_symbols = "[Latex]"
      })[entry.source.name]
      return vim_item
    end
  }
}

