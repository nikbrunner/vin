local wk = require("which-key")

local wkGroups = require("bindings.maps.groups")
local wkSingles = require("bindings.maps.singles")
local options = require("bindings.options");

local keyMaps = {
  noLeader = {
    normal = wkSingles.noLeader.normal,
    insert = wkSingles.noLeader.insert,
    visual = wkSingles.noLeader.visual
  },

  withLeader = {
    normal = {
      single = wkSingles.withLeader.normal,
      groups = {
        l = wkGroups.lsp,
        q = wkGroups.quit,
        b = wkGroups.buffer,
        c = wkGroups.copy,
        g = wkGroups.git,
        f = wkGroups.find,
        p = wkGroups.packages,
        v = wkGroups.view,
        i = wkGroups.insert,
        t = wkGroups.todo
      }
    },

    visual = { groups = { l = wkGroups.lsp } }
  }
}

vim.g.mapleader = " "

wk.register(keyMaps.noLeader.normal, options.whichKey.normal)
wk.register(keyMaps.noLeader.insert, options.whichKey.insert)
wk.register(keyMaps.noLeader.visual, options.whichKey.visual)

wk.register(keyMaps.withLeader.normal.single, options.whichKey.normal.withLeader)
wk.register(keyMaps.withLeader.normal.groups, options.whichKey.normal.withLeader)
wk.register(keyMaps.withLeader.visual.groups, options.whichKey.visual.withLeader)
