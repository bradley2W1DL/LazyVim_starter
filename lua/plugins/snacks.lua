-- Snacks does a _lot_ explorers, pickers, etc.
return {
  "folke/snacks.nvim",
  keys = {
    {
      "<leader>fg",
      function()
        Snacks.picker.grep()
      end,
      desc = "Live Grep",
    },
  },
  opts = {
    scroll = { enabled = false }, -- Disable scrolling animations
    indent = { enabled = false }, -- Disable indent guides by default
    spelling = { enabled = false }, -- No spell checker by default
    picker = require("config.picker"),
    dashboard = require("config.dashboard"),
    lazygit = {}, -- LazyGit with default config
  },
}

-- wants to mimic some nvim-tree things
-- > when opening a file where splits are present, how can I prompt which split to open the buffer into.
