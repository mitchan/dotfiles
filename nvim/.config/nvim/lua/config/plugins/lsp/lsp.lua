return {
  {
    {
      'folke/lazydev.nvim',
      ft = 'lua',
      opts = {
        library = {
          { path = 'luvit-meta/library', words = { 'vim%.uv' } },
        },
      },
    },

    {
      'neovim/nvim-lspconfig',
      dependencies = {
        { 'williamboman/mason.nvim', opts = {} },
        'williamboman/mason-lspconfig.nvim',
        'WhoIsSethDaniel/mason-tool-installer.nvim',
        { 'j-hui/fidget.nvim', opts = {} },
        'saghen/blink.cmp',
      },
      config = function()
        vim.api.nvim_create_autocmd('LspAttach', {
          group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
          callback = function(event)
            local map = function(keys, func, desc, mode)
              mode = mode or 'n'
              vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
            end

            map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

            map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })

            map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

            ---@param client vim.lsp.Client
            ---@param method vim.lsp.protocol.Method
            ---@param bufnr? integer some lsp support methods only in specific files
            ---@return boolean
            local function client_supports_method(client, method, bufnr)
              return client:supports_method(method, bufnr)
            end

            local client = vim.lsp.get_client_by_id(event.data.client_id)
            if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
              local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
              vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                buffer = event.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.document_highlight,
              })

              vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                buffer = event.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.clear_references,
              })

              vim.api.nvim_create_autocmd('LspDetach', {
                group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
                callback = function(event2)
                  vim.lsp.buf.clear_references()
                  vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
                end,
              })
            end

            if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
              map('<leader>th', function()
                vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
              end, '[T]oggle Inlay [H]ints')
            end
          end,
        })

        vim.diagnostic.config {
          severity_sort = true,
          float = { border = 'rounded', source = 'if_many' },
          underline = { severity = vim.diagnostic.severity.ERROR },
          signs = vim.g.have_nerd_font and {
            text = {
              [vim.diagnostic.severity.ERROR] = '󰅚 ',
              [vim.diagnostic.severity.WARN] = '󰀪 ',
              [vim.diagnostic.severity.INFO] = '󰋽 ',
              [vim.diagnostic.severity.HINT] = '󰌶 ',
            },
          } or {},
          virtual_text = {
            source = 'if_many',
            spacing = 2,
            format = function(diagnostic)
              local diagnostic_message = {
                [vim.diagnostic.severity.ERROR] = diagnostic.message,
                [vim.diagnostic.severity.WARN] = diagnostic.message,
                [vim.diagnostic.severity.INFO] = diagnostic.message,
                [vim.diagnostic.severity.HINT] = diagnostic.message,
              }
              return diagnostic_message[diagnostic.severity]
            end,
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

        local ensure_installed = vim.tbl_keys(servers or {})
        vim.list_extend(ensure_installed, {
          'black', -- python formatter
          'dockerls',
          'eslint-lsp',
          'eslint_d',
          'gofumpt',
          'gopls',
          'intelephense',
          'isort', -- python formatter
          'lua-language-server',
          'php-cs-fixer', -- php formatter
          'prettier',
          'prettierd',
          'stylua',
          'ts_ls',
          'vuels',
        })
        require('mason-tool-installer').setup { ensure_installed = ensure_installed }

        require('mason-lspconfig').setup {
          ensure_installed = {}, -- explicitly set to an empty table (Kickstart populates installs via mason-tool-installer)
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
  },
}
