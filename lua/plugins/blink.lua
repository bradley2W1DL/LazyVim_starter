return {
  "saghen/blink.cmp",
  dependencies = {
    { "L3MON4D3/LuaSnip", version = "v2.*" },
  },
  opts = {
    snippets = { preset = "luasnip" },
    term = { enabled = false }, -- no terminal completion
    keymap = {
      preset = "none",
      -- "default" keymaps (Ctrl + n, p, y) interfere with zellij keybinds
      -- going with a modified "super-tab" approach:
      ["<C-e>"] = { "hide", "fallback" },
      ["<Tab>"] = {
        "show_and_insert_or_accept_single",
        "select_next",
        "snippet_forward",
        "fallback",
      },
      ["<S-Tab"] = { "select_prev", "snippet_backward", "fallback" },
      ["<Down>"] = { "select_next", "snippet_forward", "fallback" },
      ["<Up>"] = { "select_prev", "snippet_backward", "fallback" },
      ["<CR>"] = {
        function(cmp)
          if cmp.is_active() and cmp.is_menu_visible() then
            if cmp.get_selected_item() == nil then
              -- menu visible, but no item selected fallback to normal return
              return false
            end

            -- accept selected item
            cmp.accept()
            return true
          end
        end,
        "fallback",
      },
      ["<C-k>"] = { "show_signature", "hide_signature", "fallback" }, -- insert mode only
      ["<C-b>"] = { "scroll_documentation_up", "fallback" },
      ["<C-f>"] = { "scroll_documentation_down", "fallback" },
    },
    completion = {
      list = {
        selection = {
          preselect = false,
          auto_insert = false,
        },
      },
      ghost_text = {
        enabled = true,
        show_with_selection = true,
        show_without_selection = false,
        show_without_menu = false,
      },
      menu = { border = "shadow" },
      documentation = { window = { border = "rounded" } },
    },
    signature = {
      window = {
        border = "solid",
        max_width = 80,
      },
    },
    sources = {
      default = { "lsp", "snippets", "buffer", "path" },
    },
  },
}
