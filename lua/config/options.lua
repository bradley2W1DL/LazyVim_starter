-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.relativenumber = false
vim.opt.backup = false
vim.opt.cmdheight = 2
vim.opt.cursorline = false
vim.opt.list = false -- Disable showing invisible characters (tabs, trailing spaces, etc.)
vim.opt.termguicolors = true
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.colorcolumn = "121"

-- Setting up buffer auth rate while I'm disabled
-- We'll see if I like this enough to keep it once I have two hands back.
vim.opt.autowrite = true
vim.opt.updatetime = 3000

vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
  group = vim.api.nvim_create_augroup("AutoSave", { clear = true }),
  callback = function()
    -- TODO, Maybe ignore certain files??
    -- 'update' only saves if the buffer has been modified
    vim.cmd("update")
  end,
})
