return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  keys = {
    {
      '<C-f>',
      function()
        -- Snacks.picker.smart()
        Snacks.picker.files { hidden = true }
      end,
      desc = 'Smart Find File',
    },
    {
      '<C-g>',
      function()
        Snacks.picker.grep { layout = 'ivy' }
      end,
      desc = 'Grep Search',
    },
    {
      'gd',
      function()
        Snacks.picker.lsp_definitions()
      end,
      desc = 'Goto Definitions',
    },
    {
      'gr',
      function()
        Snacks.picker.lsp_references()
      end,
      desc = 'Goto References',
    },
    {
      '<leader>en',
      function()
        Snacks.picker.files { cwd = vim.fn.stdpath 'config' }
      end,
      desc = 'Goto References',
    },
  },
  opts = {
    bigfile = { enabled = true },
    picker = { enabled = true },
    -- dashboard = { enabled = true },
    -- explorer = { enabled = true },
    -- indent = { enabled = true },
    -- input = { enabled = true },
    -- notifier = { enabled = true },
    -- quickfile = { enabled = true },
    -- scope = { enabled = true },
    -- scroll = { enabled = true },
    -- statuscolumn = { enabled = true },
    -- words = { enabled = true },
  },
}
