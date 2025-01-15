return {
  {
    'williamboman/mason.nvim',
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
      'saghen/blink.cmp',
    },
    config = function()
      local lspconfig = require 'lspconfig'

      require('mason').setup()

      require('mason-lspconfig').setup {
        automatic_installation = true,
        ensure_installed = {
          'emmet_language_server',
          'eslint',
          'intelephense',
          'gopls',
          'lua_ls',
          'ts_ls',
          'volar',
        },
        handlers = {
          function(server_name)
            local capabilities = require('blink.cmp').get_lsp_capabilities()
            lspconfig[server_name].setup {
              capabilities,
            }
          end,

          ['lua_ls'] = function()
            local capabilities = require('blink.cmp').get_lsp_capabilities()
            lspconfig['lua_ls'].setup {
              capabilities,
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
            local capabilities = require('blink.cmp').get_lsp_capabilities()
            lspconfig['ts_ls'].setup {

              capabilities,
              init_options = {
                plugins = {
                  {
                    name = '@vue/typescript-plugin',
                    location = '/Users/francesco/.nvm/versions/node/v22.8.0/lib/node_modules/@vue/typescript-plugin',
                    languages = { 'vue' },
                  },
                },
              },
              filetypes = { 'javascript', 'typescript', 'vue', 'typescriptreact' },
            }
          end,
        },
      }
    end,
  },
}
