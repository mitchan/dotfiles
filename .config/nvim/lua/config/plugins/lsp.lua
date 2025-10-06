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
          'ts_ls',
          'vue_ls',
        },
      },
    },
    {
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      opts = {
        ensure_installed = {
          'eslint_d',
          'gofumpt',
          'intelephense',
          'php-cs-fixer',
          'prettier',
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

    vim.lsp.config('ts_ls', {
      filetypes = { 'javascript', 'javascriptreact', 'javascript.jsx', 'typescript', 'typescriptreact', 'typescript.tsx', 'vue' },
      init_options = {
        plugins = {
          {
            name = '@vue/typescript-plugin',
            location = vim.fn.stdpath 'data' .. '/mason/packages/vue-language-server/node_modules/@vue/language-server',
            languages = { 'vue' },
          },
        },
      },
    })
    -- require 'lsps'
  end,
}
