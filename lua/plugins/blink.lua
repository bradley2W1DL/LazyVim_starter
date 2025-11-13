return {
  "saghen/blink.cmp",
  dependencies = { "L3MON4D3/LuaSnip", version = "v2.*" },
  opts = {
    snippets = { preset = "luasnip" },
    term = { enabled = false }, -- no terminal completion
    keymap = {
      preset = "default",
      -- get <Tab> to do what I want
    },
    sources = {
      default = { "lsp", "snippets", "buffer", "path" },
    },
  },
}
