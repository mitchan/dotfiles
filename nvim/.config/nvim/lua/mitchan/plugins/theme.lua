-- return {
--'catppuccin/nvim',
--name = 'catppuccin',
--priority = 1000,
--config = function()
--require('catppuccin').setup {
--flavour = 'mocha',
--transparent_background = false,
--kitty = true,
--}

--vim.cmd 'colorscheme catppuccin'
--end,
--}

-- kanagawa theme
return {
  'rebelot/kanagawa.nvim',
  name = 'kanagawa',
  priority = 1000,
  config = function()
    require('kanagawa').setup {
      keywordStyle = { italic = false },
      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = 'none',
            },
          },
        },
      },
    }

    -- set the colorscheme
    vim.cmd 'colorscheme kanagawa-dragon'
  end,
}
