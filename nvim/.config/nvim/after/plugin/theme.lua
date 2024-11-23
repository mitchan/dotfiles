function ColorMyPencils(color)
  color = color or 'catppuccin'
  vim.cmd.colorscheme(color)

  -- transparent bg
  -- vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
  -- vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
end
-- vim.cmd [[colorscheme catppuccin]]
-- vim.cmd [[colorscheme kanagawa]]
-- vim.cmd [[colorscheme night-owl]]
-- vim.cmd [[colorscheme tokyonight]]

ColorMyPencils 'catppuccin'
-- ColorMyPencils 'kanagawa'
-- ColorMyPencils 'night-owl'
-- ColorMyPencils 'tokyonight'
