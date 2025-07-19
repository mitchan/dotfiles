return {
  'mason-org/mason.nvim',
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
  },
  config = function()
    require('mason').setup()

    require('mason-lspconfig').setup {
      ensure_installed = {
        'clangd',
        'dockerls',
        'gopls',
        'intelephense',
        'lua_ls',
        'ts_ls',
      },
    }
  end,
}
