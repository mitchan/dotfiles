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
        'vtsls',
        'vue_ls',
      },
    }

    local servers = {
      clangd = {},
      intelephense = {},
      ts_ls = {
        filetypes = { 'javascript', 'typescript', 'vue', 'typescriptreact' },
        init_options = {
          plugins = {
            {
              name = '@vue/typescript-plugin',
              location = vim.fn.stdpath 'data' .. '/mason/packages/vue-language-server/node_modules/@vue/language-server',
              languages = { 'vue' },
            },
          },
        },
      },
      vtsls = {},
      vuels = {},
    }

    for server, config in pairs(servers) do
      vim.lsp.config(server, config)
      vim.lsp.enable(server)
    end
  end,
}
