vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set("i", "<C-y>", "<NOP>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { noremap = true, silent = true, desc = "Show diagnostics in float" })
