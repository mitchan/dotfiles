-- local theme = 'catppuccin'
-- local theme = 'dracula'
local theme = 'gruvbox'
-- local theme = 'nord'
-- local theme = 'rose-pine'
-- local theme = 'tokyonight'
-- local theme = 'vague'

local isCatppuccin = theme == 'catppuccin'
local isDracula = theme == 'dracula'
local isGruvbox = theme == 'gruvbox'
local isNord = theme == 'nord'
local isRosePine = theme == 'rose-pine'
local isTokyo = theme == 'tokyonight'

local transparent_bg = false
local is_light = false

local catppuccin_flavor = 'frappe'
if is_light then
  catppuccin_flavor = 'latte'
end

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

      if not isTokyo then
        return
      end

      if is_light then
        vim.cmd.colorscheme 'tokyonight-day'
      else
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
      flavour = catppuccin_flavor,
      transparent_background = transparent_bg,
    },
    config = function(_, opts)
      require('catppuccin').setup(opts)

      if not isCatppuccin then
        return
      end

      vim.cmd.colorscheme 'catppuccin'
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

  {
    'dracula/vim',
    lazy = false,
    name = 'dracula',
    priority = isDracula and 1000 or 50,
    opts = {},
    config = function()
      if isDracula then
        vim.cmd 'colorscheme dracula'
      end
    end,
  },

  {
    'morhetz/gruvbox',
    lazy = false,
    name = 'gruvbox',
    priority = isGruvbox and 1000 or 50,
    opts = {},
    config = function()
      if isGruvbox then
        vim.cmd 'colorscheme gruvbox'
      end
    end,
  },

  {
    'shaunsingh/nord.nvim',
    lazy = false,
    priority = isNord and 1000 or 50,
    opts = {},
    config = function()
      if isNord then
        vim.cmd 'colorscheme nord'
      end
    end,
  },
}
