-- Vim Leader Key keybindings
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Vim pop out error message binding
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
