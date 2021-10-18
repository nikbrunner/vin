local wkGroups = require("bindings.keymaps.groups")
local wkSingles = require("bindings.keymaps.singles")

local KeyMaps = {}

KeyMaps = {
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
        s = wkGroups.search,
        p = wkGroups.packages,
        v = wkGroups.view,
        i = wkGroups.insert,
        t = wkGroups.todo
      }
    },

    visual = { groups = { l = wkGroups.lsp } }
  }
}

return KeyMaps
