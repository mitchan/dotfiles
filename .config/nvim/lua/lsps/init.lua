local lspconfig = require 'lspconfig'

require 'lsps.lua_ls'(lspconfig)
require 'lsps.ts_ls'(lspconfig)
require 'lsps.vue_ls'(lspconfig)

-- lspconfig.eslint_d.setup {}
