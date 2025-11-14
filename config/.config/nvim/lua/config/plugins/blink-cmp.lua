return {
  'saghen/blink.cmp',
  dependencies = { 'rafamadriz/friendly-snippets' },

  version = '*',

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

    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
      providers = {
        lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
      },
    },

    fuzzy = { implementation = 'lua' },
  },
  opts_extend = { 'sources.default' },
}
