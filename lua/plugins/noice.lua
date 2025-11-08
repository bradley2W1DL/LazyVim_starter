-- This is what controls the cmdline and messages, etc?
return {
  "folke/noice.nvim",
  opts = {
    cmdline = {
      view = "cmdline",
      format = {
        cmdline = { pattern = "^:", icon = "_", lang = "vim" },
      },
      -- this is a change
    },
    presets = {
      bottom_search = true,
    },
    routes = {
      {
        view = "notify",
        filter = {
          event = "msg_show",
          kind = "search_count",
        },
        opts = { skip = true },
      },
    },
  },
}
