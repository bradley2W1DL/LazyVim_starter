local snip_setup_ok, luasnip = pcall(require, "luasnip")
if not snip_setup_ok then
  vim.notify("error loading 'luasnip' plugin")
  return
end

local snippet = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node

return {
  snippet("if", {
    t("<% if "),
    i(1, "cond"),
    t(" %>"),
    t({ "", "  " }),
    i(2, "content"),
    t({ "", "<% end %>" }),
  }),
  snippet("ifelse", {
    t("<% if "),
    i(1, "cond"),
    t(" %>"),
    t({ "", "<% else %>" }),
    t({ "", "<% end %>" }),
  }),
  -- Add more ERB snippets here (e.g., <% %> for execution, <%= %> for output)
  snippet("eq", {
    t("<%= "),
    i(0),
    t(" %>"),
  }),
  snippet("exec", {
    t("<% "),
    i(0),
    t(" %>"),
  }),
}
