-- Snacks picker opts config
-- https://github.com/folke/snacks.nvim/blob/main/docs/picker.md
return {
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
}
