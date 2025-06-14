return {

  {
    'mason-org/mason.nvim',
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
    },
    opts = {},
    config = function(_, opts)
      require('mason').setup(opts)

      require('mason-lspconfig').setup {
        ensure_installed = {
          'dockerls',
          'gopls',
          'intelephense',
          'lua_ls',
          'ts_ls',
          'vuels',
        },
      }

      local original_capabilities = vim.lsp.protocol.make_client_capabilities()
      local capabilities = require('blink.cmp').get_lsp_capabilities(original_capabilities)

      local servers = {
        lua_ls = {
          settings = {
            Lua = {
              completion = {
                callSnippet = 'Replace',
              },
            },
          },
        },
        pylsp = {},
        ts_ls = {
          filetypes = { 'javascript', 'typescript', 'vue', 'typescriptreact' },
          init_options = {
            plugins = {
              {
                name = '@vue/typescript-plugin',
                location = vim.fn.stdpath 'data' .. '/mason/packages/vuels/node_modules/@vue/language-server',
                languages = { 'vue' },
              },
            },
          },
          -- settings = {
          --   typescript = {
          --     tsserver = {
          --       useSyntaxServer = false,
          --     },
          --     inlayHints = {
          --       includeInlayParameterNameHints = 'all',
          --       includeInlayParameterNameHintsWhenArgumentMatchesName = true,
          --       includeInlayFunctionParameterTypeHints = true,
          --       includeInlayVariableTypeHints = true,
          --       includeInlayVariableTypeHintsWhenTypeMatchesName = true,
          --       includeInlayPropertyDeclarationTypeHints = true,
          --       includeInlayFunctionLikeReturnTypeHints = true,
          --       includeInlayEnumMemberValueHints = true,
          --     },
          --   },
          -- },
        },
        vuels = {
          init_options = {
            vue = {
              hybridMode = false,
            },
          },
          -- settings = {
          --   typescript = {
          --     inlayHints = {
          --       enumMemberValues = {
          --         enabled = true,
          --       },
          --       functionLikeReturnTypes = {
          --         enabled = true,
          --       },
          --       propertyDeclarationTypes = {
          --         enabled = true,
          --       },
          --       parameterTypes = {
          --         enabled = true,
          --         suppressWhenArgumentMatchesName = true,
          --       },
          --       variableTypes = {
          --         enabled = true,
          --       },
          --     },
          --   },
          -- },
        },
      }

      require('mason-lspconfig').setup {
        ensure_installed = {},
        automatic_enable = true,
        automatic_installation = false,
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }
    end,
  },
}
