return {
  'saghen/blink.cmp',
  dependencies = { 'rafamadriz/friendly-snippets' },

  version = '1.*',

  opts = {
    keymap = { preset = 'enter' },

    appearance = {
      nerd_font_variant = 'mono',
    },

    completion = {
      documentation = { auto_show = true },
      trigger = {
        show_on_keyword = false,
        show_on_trigger_character = false,
      },
    },

    -- sources = {
    --   default = { 'lsp', 'path', 'snippets', 'buffer' },
    -- },

    fuzzy = { implementation = 'prefer_rust_with_warning' },
  },
  opts_extend = { 'sources.default' },
}
