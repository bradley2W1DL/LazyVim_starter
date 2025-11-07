-- Snacks does a _lot_ explorers, pickers, etc.
-- https://github.com/folke/snacks.nvim/blob/main/docs/picker.md
-- <arbitrary change for submodule learning>
return {
  "folke/snacks.nvim",
  opts = {
    scroll = {
      enabled = false, -- Disable scrolling animations
    },
    picker = {
      sources = {
        -- configures the file-tree (neo-tree)
        explorer = {
          win = {
            list = {
              keys = {
                ["o"] = "confirm",
                ["W"] = "explorer_close_all",
              },
            },
          },
        },
      },
    },
  },
}
