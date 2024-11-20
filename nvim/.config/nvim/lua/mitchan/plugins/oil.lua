return {
  'stevearc/oil.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('oil').setup {
      default_file_explorer = true,
      delete_to_trash = true,
      view_options = {
        natural_order = true,
        show_hidden = true,
      },
    }
  end,
}
