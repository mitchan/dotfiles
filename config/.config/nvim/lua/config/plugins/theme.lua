local theme = 'gruvbox'
-- local theme = 'tokyonight'

local isGruvbox = theme == 'gruvbox'
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

      if not isTokyo then
        return
      end

      vim.cmd.colorscheme 'tokyonight'
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
}
