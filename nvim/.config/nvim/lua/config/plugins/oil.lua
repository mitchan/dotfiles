return {
  'stevearc/oil.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  opts = {
    default_file_explorer = true,
    delete_to_trash = true,
    float = {
      padding = 2,
      max_width = 120,
      max_height = 20,
    },
    view_options = {
      natural_order = true,
      show_hidden = true,
      is_always_hidden = function(name, _)
        return name == '..' or name == '.git'
      end,
    },
  },
}
