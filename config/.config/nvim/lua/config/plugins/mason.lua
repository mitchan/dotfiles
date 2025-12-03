return {
  {
    'williamboman/mason-lspconfig.nvim',
    opts = {
      ensure_installed = {
        'bashls',
        'clangd',
        'cssls',
        'dockerls',
        'emmet_ls',
        'eslint',
        'gopls',
        'html',
        'lua_ls',
        'tailwindcss',
        'ts_ls',
        'vue_ls',
      },
    },
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
      'neovim/nvim-lspconfig',
    },
  },
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    opts = {
      ensure_installed = {
        'biome',
        'eslint_d',
        'gofumpt',
        'prettier',
        'prettierd',
        'stylua',
      },
    },
    dependencies = {
      'mason-org/mason.nvim',
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
}
