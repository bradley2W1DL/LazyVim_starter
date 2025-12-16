return {
  "L3MON4D3/LuaSnip",
  opts = function(_, opts)
    -- Load snippets from ~/.config/nvim/snippets/
    require("luasnip.loaders.from_lua").load({
      paths = { vim.fn.stdpath("config") .. "/snippets" },
    })

    -- You can extend opts if needed for additional config
    -- opts.history = true -- default in LazyVim
    -- opts.update_events = "TextChanged,TextChangedI"

    return opts
  end,
}
