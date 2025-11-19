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
    -- NeoTree file explorer config
    explorer = {
      hidden = true,
      ignored = true,
      layout = {
        auto_hide = { "input" },
      },
      win = {
        list = {
          keys = {
            ["o"] = "confirm", -- toggle dirs, open files
            ["W"] = "explorer_close_all",
            ["y"] = "yank_relative_cwd",
            ["Y"] = "yank_relative_home",
            -- TODO, these keybinds not working...
            -- ["K"] = "jump_to_first_relative_item",
            -- ["J"] = "jump_to_last_relative_item",
          },
        },
      },
      actions = {
        yank_relative_cwd = function(_, item)
          local path = vim.fn.fnamemodify(item.file, ":.")
          vim.fn.setreg("+", path)
          vim.fn.setreg('"', path)
          vim.notify("Yanked: " .. path)
        end,
        yank_relative_home = function(_, item)
          local path = vim.fn.fnamemodify(item.file, ":~")
          vim.fn.setreg("+", path)
          vim.fn.setreg('"', path)
          vim.notify("Yanked: " .. path)
        end,
        jump_to_first_relative_item = function(picker, item)
          if not (picker.list and #picker.list > 0) or not item or not item.file then
            return
          end
          local parent = vim.fn.fnamemodify(item.file, ":h")
          for i = 1, #picker.list do
            local it = picker.list[i]
            if it and it.file and vim.fn.fnamemodify(it.file, ":h") == parent then
              picker.list:_move(i)
              return
            end
          end
        end,
        jump_to_last_relative_item = function(picker)
          -- require("snacks.debug").inspect(picker)
          if picker.list and #picker.list > 0 then
            picker.list:_move(#picker.list, true, true)
          end
        end,
      },
    },
  },
}
