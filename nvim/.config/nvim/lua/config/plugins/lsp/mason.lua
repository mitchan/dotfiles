return {
  {
    'williamboman/mason.nvim',
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
    },
    config = function()
      require('mason').setup()

      require('mason-lspconfig').setup {
        automatic_installation = true,
        ensure_installed = {
          'eslint',
          'intelephense',
          'gopls',
          'lua_ls',
          'ts_ls',
          'volar',
        },
        handlers = {
          function(server_name)
            require('lspconfig')[server_name].setup {}
          end,

          ['lua_ls'] = function()
            require('lspconfig')['lua_ls'].setup {
              settings = {
                Lua = {
                  completion = {
                    callSnippet = 'Replace',
                  },
                },
              },
            }
          end,

          ['ts_ls'] = function()
            require('lspconfig')['ts_ls'].setup {

              -- init_options = {
              -- plugins = {
              --   {
              --     name = '@vue/typescript-plugin',
              --     location = '/Users/francesco/.nvm/versions/node/v22.8.0/lib/node_modules/@vue/typescript-plugin',
              --     languages = { 'typescript', 'vue' },
              --   },
              -- },
              -- },
              filetypes = { 'javascript', 'typescript', 'vue', 'typescriptreact' },
            }
          end,
        },
      }
    end,
  },
}
