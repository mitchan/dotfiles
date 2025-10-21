-- local theme = 'catppuccin'
-- local theme = 'dracula'
-- local theme = 'gruvbox'
local theme = 'rose-pine'
-- local theme = 'tokyonight'

local isCatppuccin = theme == 'catppuccin'
local isDracula = theme == 'dracula'
local isGruvbox = theme == 'gruvbox'
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

  -- {
  --   'morhetz/gruvbox',
  --   lazy = false,
  --   name = 'gruvbox',
  --   priority = isGruvbox and 1000 or 50,
  --   opts = {},
  --   config = function()
  --     if isGruvbox then
  --       vim.g.gruvbox_invert_selection = 0
  --       vim.g.gruvbox_italic = 1
  --       vim.g.gruvbox_bold = 1
  --
  --       vim.cmd 'colorscheme gruvbox'
  --     end
  --   end,
  -- },

  {
    'sainnhe/gruvbox-material',
    -- priority = 1000,
    priority = isGruvbox and 1000 or 50,
    config = function()
      if isGruvbox then
        vim.g.gruvbox_material_enable_italic = true
        vim.cmd.colorscheme 'gruvbox-material'
      end
    end,
  },
}
