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
    -- {
    --   'williamboman/mason-lspconfig.nvim',
    --   opts = {
    --     ensure_installed = {
    --     },
    --   },
    -- },
    {
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      opts = {
        ensure_installed = {
          -- lsp
          'bash-language-server',
          'clangd',
          'css-lsp',
          'dockerfile-language-server',
          'emmet-language-server',
          'gopls',
          'html-lsp',
          'intelephense',
          'lua-language-server',
          'tailwindcss-language-server',
          'typescript-language-server',

          -- formatter / linters / etc...
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
    require 'lsps'
  end,
}
