-- local theme = 'gruvbox'
local theme = 'nightfox'
-- local theme = 'onedark'

local isGruvbox = theme == 'gruvbox'
local isNightfox = theme == 'nightfox'
local isOneDark = theme == 'onedark'

local transparent_bg = false

return {
  {
    'EdenEast/nightfox.nvim',
    priority = isNightfox and 1000 or 50,
    opts = {
      options = {
        transparent = transparent_bg,
      },
    },
    config = function(_, opts)
      if isNightfox then
        require('nightfox').setup(opts)
        vim.cmd.colorscheme 'terafox'
      end
    end,
  },

  {
    'sainnhe/gruvbox-material',
    priority = isGruvbox and 1000 or 50,
    config = function()
      if isGruvbox then
        vim.g.gruvbox_material_enable_italic = true
        vim.g.gruvbox_material_transparent_background = transparent_bg
        vim.cmd.colorscheme 'gruvbox-material'
      end
    end,
  },

  {
    'navarasu/onedark.nvim',
    priority = isOneDark and 1000 or 50,
    opts = {
      style = 'warmer',
    },
    config = function(_, opts)
      if isOneDark then
        require('onedark').setup(opts)
        require('onedark').load()
      end
    end,
  },
}
