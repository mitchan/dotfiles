-- local theme = 'catppuccin'
-- local theme = 'rose-pine'
local theme = 'tokyonight'

local isCatppuccin = theme == 'catppuccin'
local isRosePine = theme == 'rose-pine'
local isTokyo = theme == 'tokyonight'

local transparent_bg = false

return {
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = isTokyo and 1000 or 50,
    opts = {
      transparent = transparent_bg,
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
      -- flavour = 'macchiato',
      transparent_background = transparent_bg,
    },
    config = function(_, opts)
      require('catppuccin').setup(opts)

      if isCatppuccin then
        vim.cmd.colorscheme 'catppuccin'
      end
    end,
  },

  {
    'rose-pine/neovim',
    lazy = false,
    name = 'rose-pine',
    priority = isRosePine and 1000 or 50,
    opts = {
      styles = {
        transparency = transparent_bg,
      },
    },
    config = function(_, opts)
      require('rose-pine').setup(opts)

      if isRosePine then
        vim.cmd 'colorscheme rose-pine'
      end
    end,
  },
}
