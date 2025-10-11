return function(lspconfig)
  lspconfig.ts_ls.setup {
    filetypes = {
      'typescript',
      'javascript',
      'typescriptreact',
      'javascriptreact',
      'vue',
    },
    settings = {
      typescript = {
        indentStyle = 'space',
        indentSize = 2,
      },
    },
  }
end
