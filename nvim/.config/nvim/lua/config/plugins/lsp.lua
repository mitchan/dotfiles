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
    },
    config = function()
      require('mason').setup()

      local lsps = {
        'clangd',
        'dockerls',
        'gopls',
        'intelephense',
        'lua_ls',
        'ts_ls',
      }

      require('mason-lspconfig').setup {
        ensure_installed = lsps,
      }

      vim.lsp.enable(lsps)

      vim.diagnostic.config {
        virtual_lines = true,
        -- virtual_text = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        float = {
          border = 'rounded',
          source = true,
        },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = '󰅚 ',
            [vim.diagnostic.severity.WARN] = '󰀪 ',
            [vim.diagnostic.severity.INFO] = '󰋽 ',
            [vim.diagnostic.severity.HINT] = '󰌶 ',
          },
          numhl = {
            [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
            [vim.diagnostic.severity.WARN] = 'WarningMsg',
          },
        },
      }
    end,
  },
}
