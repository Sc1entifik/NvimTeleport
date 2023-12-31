local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
local uv = vim.uv or vim.loop

-- Auto-install lazy.nvim if not present
if not uv.fs_stat(lazypath) then
  print('Installing lazy.nvim....')
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
  print('Done.')
end

vim.opt.rtp:prepend(lazypath)


--Put Plugins you wish to install here
require('lazy').setup({
  --colorschemes
  {'folke/tokyonight.nvim'},
  --mason language server support
  {'williamboman/mason.nvim'},
  {'williamboman/mason-lspconfig.nvim'},
  --nvim-treesitter
  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
  --telescope
  {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
      dependencies = { 'nvim-lua/plenary.nvim' }
  },
	--autopairs
	{'jiangmiao/auto-pairs'},
	--configures vertical code indentation lines
	{ "lukas-reineke/indent-blankline.nvim" },
  -- LSP Support
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'dev-v3',
    lazy = true,
    config = false,
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      {'hrsh7th/cmp-nvim-lsp'},
    }
  },
  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      {'L3MON4D3/LuaSnip'}
    },
  },
})
