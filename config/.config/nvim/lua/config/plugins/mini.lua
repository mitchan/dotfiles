return {
  {
    'nvim-mini/mini.ai',
    version = false,
    opts = { n_lines = 500 },
    config = function(_, opts)
      require('mini.ai').setup(opts)
    end,
  },

  {
    'nvim-mini/mini.bracketed',
    version = false,
    config = function(_, opts)
      require('mini.bracketed').setup(opts)
    end,
  },

  {
    'nvim-mini/mini.notify',
    version = false,
    config = function(_, opts)
      require('mini.notify').setup(opts)
    end,
  },

  {
    'nvim-mini/mini.pairs',
    version = false,
    config = function(_, opts)
      require('mini.pairs').setup(opts)
    end,
  },

  -- {
  --   'nvim-mini/mini.statusline',
  --   version = false,
  --   opts = { use_icons = vim.g.have_nerd_font },
  --   config = function(_, opts)
  --     local statusline = require 'mini.statusline'
  --     statusline.setup(opts)
  --
  --     ---@diagnostic disable-next-line: duplicate-set-field
  --     statusline.section_location = function()
  --       return '%2l:%-2v'
  --     end
  --   end,
  -- },

  {
    'nvim-mini/mini.surround',
    version = false,
    config = function(_, opts)
      require('mini.surround').setup(opts)
    end,
  },
}
