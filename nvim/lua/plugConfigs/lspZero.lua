local lsp = require('lsp-zero').preset({})

lsp.extend_cmp()

lsp.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp.default_keymaps({buffer = bufnr})
end)

vim.diagnostic.config({
	virtual_text = true,
})

require('mason').setup({})
require('mason-lspconfig').setup({
  handlers = {lsp.default_setup},
})
