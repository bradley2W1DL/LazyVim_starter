-- Snacks.nvim dashboard opts
-- https://github.com/folke/snacks.nvim/blob/main/docs/dashboard.md
return {
  sections = {
    {
      section = "terminal",
      -- render the current Omarchy background
      -- cmd = "chafa ~/.config/omarchy/current/background --format symbols --symbols vhalf --size 60x17 --stretch; sleep .1",
      -- Render the Great Wave Off Kanagawa - Hokusai
      -- cmd = "chafa ~/.config/nvim/extras/kanagawa.jpg --format symbols --symbols vhalf --size 60x17 --stretch; sleep .1",
      -- Live bonsai tree
      -- cmd = "cbonsai -li -w 3.0 --leaf=&, --message=NEOVIM", -- TODO, get this to match the theme
      cmd = "cbonsai -li -w 3.0 --leaf=&,", -- message flag not working on OSX, brew installation 🤷‍♂️
      height = 17,
      padding = 1,
    },
    {
      pane = 2,
      { section = "keys", gap = 1, padding = 1 },
      { section = "startup" },
    },
  },
}
