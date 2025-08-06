vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

vim.g.have_nerd_font = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.colorcolumn = '100'

vim.opt.mouse = 'a'

vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

vim.opt.breakindent = true

vim.opt.swapfile = false
vim.opt.showmode = false
vim.opt.undofile = true
vim.opt.undodir = os.getenv 'HOME' .. '/.vim/undodir'

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.updatetime = 50
-- vim.opt.timeoutlen = 300

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.opt.inccommand = 'split'

vim.opt.cursorline = true

vim.opt.scrolloff = 10

-- tabs & indentation
vim.opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
vim.opt.shiftwidth = 2 -- 2 spaces for indent width
vim.opt.expandtab = true -- expand tab to spaces
vim.opt.autoindent = true -- copy indent from current line when starting new ones

-- turn on termguicolors for tokyonight colorscheme to work
-- (have to use iterm2 or any other true color terminal)
vim.opt.termguicolors = true
vim.opt.background = 'dark' -- colorschemes that can be light or dark will be made dark
vim.opt.signcolumn = 'yes' -- show sign column so that text doesn't shift

-- backspace
vim.opt.backspace = 'indent,eol,start' -- allow backspace on indent, end of line or insert mode start position

-- Set the default border for all floating windows
vim.opt.winborder = 'rounded'
