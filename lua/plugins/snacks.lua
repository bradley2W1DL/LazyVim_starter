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
    {
      "<leader>gb",
    },
  }, -- override some keymaps "<leader>gb"
  opts = {
    scroll = {
      enabled = false, -- Disable scrolling animations
    },
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
      sources = {
        -- git = false,
        -- configures the file-tree (neo-tree)
        git_log = {
          layout = "git_dropdown",
        },
        git_diff = {
          layout = "git_dropdown",
        },
        explorer = {
          win = {
            input = {
              keys = {
                ["J"] = { "preview_scroll_down", mode = { "n" } }, -- TODO get this working.
                ["K"] = { "preview_scroll_up", mode = { "n" } },
                ["<M-q>"] = { "qflist", mode = { "i", "n" } },
              },
            },
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
    -- dashboard = {} -- replacement for separate alpha-vim conifg??
  },
}

-- wants to mimic some nvim-tree things
-- > when opening a file where splits are present, how can I prompt which split to open the buffer into.
