return {
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        { path = 'luvit-meta/library', words = { 'vim%.uv' } },
      },
    },
  },

  'neovim/nvim-lspconfig',

  {
    'mason-org/mason.nvim',
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
    },
    config = function()
      require('mason').setup {
        ui = {
          icons = {
            package_installed = '✓',
            package_pending = '➜',
            package_uninstalled = '✗',
          },
        },
      }

      local mason_tool_installer = require 'mason-tool-installer'
      mason_tool_installer.setup {
        ensure_installed = {
          'black',
          'eslint_d',
          'gofumpt',
          'intelephense',
          'isort',
          'prettier',
          'prettierd',
          'pylint',
          'stylua',
        },
      }

      local lsps = {
        'bashls',
        'clangd',
        'cssls',
        'dockerls',
        'emmet_language_server',
        'gopls',
        'html',
        'intelephense',
        'lua_ls',
        'tailwindcss',
        'ts_ls',
        -- 'vtsls',
        -- 'vue_ls',
      }

      require('mason-lspconfig').setup {
        ensure_installed = lsps,
      }

      vim.lsp.enable(lsps)

      require('utils.diagnostics').setup()
    end,
  },
}
