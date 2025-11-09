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
    -- https://github.com/folke/snacks.nvim/blob/main/docs/picker.md
    picker = {
      layout = "telescope", -- default layout to be used
      layouts = {
        git_dropdown = { -- this layout exists, will the table be merged with existing?
          layout = {
            backdrop = false,
            row = 1,
            width = 0.4,
            min_width = 80,
            height = 0.8,
            border = "none",
            box = "vertical",
            { win = "preview", title = "{preview}", height = 0.75, border = true },
            {
              box = "vertical",
              border = true,
              title = "{title} {live} {flags}",
              title_pos = "center",
              { win = "input", height = 1, border = "bottom" },
              { win = "list", border = "none" },
            },
          },
        },
      },
      matcher = {
        frecency = true, -- give weight to more recently opened file
      },
      win = {
        input = {
          keys = {
            ["J"] = { "preview_scroll_down", mode = { "n" } }, -- TODO get this working.
            ["K"] = { "preview_scroll_up", mode = { "n" } },
            ["<M-q>"] = { "qflist", mode = { "i", "n" } },
          },
        },
      },
      sources = {
        git_log = {
          layout = "git_dropdown",
          on_show = function()
            vim.cmd.stopinsert() -- start in normal-mode
          end,
        },
        git_diff = {
          layout = "git_dropdown",
          on_show = function()
            vim.cmd.stopinsert()
          end,
        },
        gh_actions = false,
        explorer = {
          win = {
            list = {
              keys = {
                ["o"] = "confirm", -- toggle dirs, open files
                ["W"] = "explorer_close_all",
              },
            },
          },
        },
      },
    },
    dashboard = {
      sections = {
        {
          section = "terminal",
          -- render the current Omarchy background
          -- cmd = "chafa ~/.config/omarchy/current/background --format symbols --symbols vhalf --size 60x17 --stretch; sleep .1",
          -- Render the Great Wave Off Kanagawa - Hokusai
          -- cmd = "chafa ~/.config/nvim/extras/kanagawa.jpg --format symbols --symbols vhalf --size 60x17 --stretch; sleep .1",
          -- Live bonsai tree
          cmd = "cbonsai -li -w 3.0 --leaf=&, --message=NEOVIM", -- TODO, get this to match the theme
          height = 17,
          padding = 1,
        },
        {
          pane = 2,
          { section = "keys", gap = 1, padding = 1 },
          { section = "startup" },
        },
      },
    },
  },
}

-- wants to mimic some nvim-tree things
-- > when opening a file where splits are present, how can I prompt which split to open the buffer into.
