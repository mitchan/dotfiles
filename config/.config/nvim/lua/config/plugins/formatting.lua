local function fmtPrettier()
  -- return { 'prettierd', 'prettier', stop_after_first = true }
  return { 'biome', 'biome-organize-imports' }
end

return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  opts = {
    notify_on_error = false,
    format_on_save = function()
      -- example for preventing format for specific file types
      -- local disable_filetypes = { c = true, cpp = true }
      return {
        timeout_ms = 500,
        lsp_fallback = 'fallback',
        -- lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
      }
    end,
    formatters_by_ft = {
      css = fmtPrettier(),
      html = fmtPrettier(),
      go = { 'gofumpt' },
      javascript = fmtPrettier(),
      javascriptreact = fmtPrettier(),
      json = fmtPrettier(),
      lua = { 'stylua' },
      markdown = fmtPrettier(),
      php = { 'php-cs-fixer' },
      python = { 'isort', 'black' },
      typescript = fmtPrettier(),
      typescriptreact = fmtPrettier(),
      vue = fmtPrettier(),
      yaml = fmtPrettier(),
    },
    formatters = {
      ['php-cs-fixer'] = {
        command = 'php-cs-fixer',
        args = {
          'fix',
          '--rules=@PSR12', -- Formatting preset. Other presets are available, see the php-cs-fixer docs.
          '$FILENAME',
        },
        stdin = false,
      },
    },
  },
}
