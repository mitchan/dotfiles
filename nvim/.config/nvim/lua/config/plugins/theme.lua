-- local theme = 'catppuccin'
local theme = 'tokyonight'

local isCatppuccin = theme == 'catppuccin'
local isTokyo = theme == 'tokyonight'

return {
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = isTokyo and 1000 or 50,
    opts = {
      transparent = false,
    },
    config = function(_, opts)
      require('tokyonight').setup(opts)

      if isTokyo then
        vim.cmd.colorscheme 'tokyonight'
      end
    end,
  },

  {
    'catppuccin/nvim',
    lazy = false,
    name = 'catppuccin',
    priority = isCatppuccin and 1000 or 50,
    opts = {
      flavour = 'frappe',
      transparent_background = false,
    },
    config = function(_, opts)
      require('catppuccin').setup(opts)

      if isCatppuccin then
        vim.cmd.colorscheme 'catppuccin'
      end
    end,
  },
}
