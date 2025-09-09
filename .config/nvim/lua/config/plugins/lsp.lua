return {
  'neovim/nvim-lspconfig',
  dependencies = {
    {
      'mason-org/mason.nvim',
      opts = {
        ui = {
          icons = {
            package_installed = '✓',
            package_pending = '➜',
            package_uninstalled = '✗',
          },
        },
      },
    },
    {
      'williamboman/mason-lspconfig.nvim',
      opts = {
        -- automatic_installation = false,
        ensure_installed = {
          'bashls',
          'clangd',
          'cssls',
          'dockerls',
          'eslint',
          'gopls',
          'html',
          'intelephense',
          'lua_ls',
          'tailwindcss',
          'vtsls',
          'vue_ls',
        },
      },
    },
    {
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      opts = {
        ensure_installed = {
          'black',
          'eslint_d',
          'gofumpt',
          'intelephense',
          'isort',
          'prettier',
          'pylint',
          'stylua',
        },
      },
    },
    {
      'folke/lazydev.nvim',
      ft = 'lua',
      opts = {
        library = {
          {
            path = 'luvit-meta/library',
            words = { 'vim%.uv' },
          },
        },
      },
    },
  },
  config = function()
    require('utils.diagnostics').setup()
    -- require 'lsps'
  end,
}
