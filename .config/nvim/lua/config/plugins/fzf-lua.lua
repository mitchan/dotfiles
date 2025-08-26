return {
  'ibhagwan/fzf-lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  keys = {
    {
      '<C-f>',
      function()
        require('fzf-lua').files()
      end,
      desc = 'Find Files in project directory',
    },
    {
      '<C-g>',
      function()
        require('fzf-lua').live_grep()
      end,
      desc = 'Find by grepping in project directory',
    },
    {
      'gd',
      function()
        require('fzf-lua').lsp_definitions()
      end,
      desc = 'Find by grepping in project directory',
    },
    {
      'gr',
      function()
        require('fzf-lua').lsp_references()
      end,
      desc = 'Find by grepping in project directory',
    },
    {
      '<leader>en',
      function()
        require('fzf-lua').files { cwd = vim.fn.stdpath 'config' }
      end,
      desc = 'Find by grepping in project directory',
    },
    {
      '<leader><leader>',
      function()
        require('fzf-lua').buffers()
      end,
      desc = 'Open buffers',
    },
  },
  opts = {},
}
