-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
-- Delete any default LazyVim keymaps that I don't want or are interfering with other keymaps
-- vim.keymap.del("n", "<leader>e") -- snacks.explorer keymap

--
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- quickly clear search highlighting
keymap("n", "<leader>n", ":noh<cr>", opts)

-- prevent x,X,<Delete> from yanking to clipboard register
keymap("n", "x", '"_x', opts)
keymap("n", "X", '"_X', opts)
keymap("n", "<Del>", '"_x', opts)

-- Normal --
------------
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Insert --
------------
-- enable "fast-exit" of insert mode with "jk" combo
-- be forwarned, you will start typing "jk" at the end of all your sentences in ALL text editors
keymap("i", "jk", "<ESC>", opts)

-- Visual --
------------
-- stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move selected text up and down
keymap("v", "<A-k>", ":m .-2<cr>==", opts)
keymap("v", "∆", ":m .+1<CR>==", opts)
-- retains yanked line in register when pasting over selected text
keymap("v", "p", '"_dP', opts)

-- Visual Block --
------------------
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts) -- todo, "alt" key remapping not really working
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts) -- todo, "alt" key remapping not really working
