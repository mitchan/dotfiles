-- vim.cmd 'let g:netrw_liststyle = 3'

local opt = vim.opt

opt.number = true
-- opt.relativenumber = true

opt.mouse = 'a'

opt.showmode = false

vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

opt.breakindent = true

opt.undofile = true

opt.ignorecase = true
opt.smartcase = true

opt.updatetime = 250

-- opt.timeoutlen = 300

opt.splitright = true
opt.splitbelow = true

opt.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

opt.inccommand = 'split'

opt.cursorline = true

opt.scrolloff = 10

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new ones

-- turn on termguicolors for tokyonight colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = 'dark' -- colorschemes that can be light or dark will be made dark
opt.signcolumn = 'yes' -- show sign column so that text doesn't shift

-- backspace
opt.backspace = 'indent,eol,start' -- allow backspace on indent, end of line or insert mode start position
