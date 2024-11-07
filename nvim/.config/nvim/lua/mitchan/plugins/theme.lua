-- return {
--   'folke/tokyonight.nvim',
--   lazy = false,
--   priority = 1000,
--   opts = {},
--   config = function()
--     vim.cmd [[colorscheme tokyonight]]
--   end,
-- }

-- return {
--   'catppuccin/nvim',
--   name = 'catppuccin',
--   priority = 1000,
--   config = function()
--     require('catppuccin').setup {
--       flavour = 'frappe',
--       transparent_background = false,
--       kitty = true,
--     }
--
--     vim.cmd 'colorscheme catppuccin'
--   end,
-- }

return {
  'rebelot/kanagawa.nvim',
  name = 'kanagawa',
  config = function()
    require('kanagawa').setup {}

    vim.cmd 'colorscheme kanagawa'
  end,
}
