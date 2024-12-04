local function fmtPrettier()
  return { 'prettierd', 'prettier', stop_after_first = true }
end

return { -- Autoformat
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format { async = true, lsp_fallback = true }
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      -- Disable "format_on_save lsp_fallback" for languages that don't
      -- have a well standardized coding style. You can add additional
      -- languages here or re-enable it for the disabled ones.
      local disable_filetypes = { c = true, cpp = true }
      return {
        timeout_ms = 500,
        lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
      }
    end,
    formatters_by_ft = {
      lua = { 'stylua' },
      javascript = fmtPrettier(),
      typescript = fmtPrettier(),
      javascriptreact = fmtPrettier(),
      typescriptreact = fmtPrettier(),
      css = fmtPrettier(),
      vue = fmtPrettier(),
      html = fmtPrettier(),
      json = fmtPrettier(),
      yaml = fmtPrettier(),
      markdown = fmtPrettier(),
      php = { 'php-cs-fixer' },
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
