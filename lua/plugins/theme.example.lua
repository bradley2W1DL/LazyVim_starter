-- On Omarchy distro this file will be replaced by a symlink to the current theme/neovim.lua file
-- On OSX it will just be copied to `theme.lua` in this same dir and the empty return removed.

-- todo can this conditional use a yadm template variable??
if true then
  return {}
end

return {
  {
    "ribru17/bamboo.nvim",
    priority = 1000,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "bamboo",
    },
  },
}
