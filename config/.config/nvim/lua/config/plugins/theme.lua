local theme = 'gruvbox'

local isGruvbox = theme == 'gruvbox'

return {
  {
    'sainnhe/gruvbox-material',
    priority = isGruvbox and 1000 or 50,
    config = function()
      if isGruvbox then
        vim.g.gruvbox_material_enable_italic = true
        -- vim.g.gruvbox_material_transparent_background = true
        vim.cmd.colorscheme 'gruvbox-material'
      end
    end,
  },
}
