return {
  'stevearc/oil.nvim',
  opts = {
    default_file_explorer = true,
    delete_to_trash = true,
    float = {
      padding = 5,
      -- max_width = 120,
      -- max_height = 20,
    },
    view_options = {
      natural_order = true,
      show_hidden = true,
      is_always_hidden = function(name, _)
        return name == '..' or name == '.git'
      end,
    },
  },
  config = function(_, opts)
    require('oil').setup(opts)

    vim.keymap.set('n', '-', '<CMD>Oil --float<CR>', { desc = 'Open parent directory' })
  end,
}
