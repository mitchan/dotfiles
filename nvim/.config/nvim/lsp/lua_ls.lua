return {
  settings = {
    Lua = {
      workspace = {
        checkThirdParty = false,
      },
      completion = {
        callSnippet = 'Replace',
      },
      telemetry = {
        enable = false,
      },
      diagnostics = {
        globals = { 'vim' },
      },
    },
  },
}
