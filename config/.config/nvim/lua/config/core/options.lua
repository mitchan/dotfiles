vim.opt.cursorline = true
vim.opt.number = true
-- vim.opt.relativenumber = true

-- visual settings
vim.opt.colorcolumn = '100'
vim.opt.signcolumn = 'yes'
vim.opt.termguicolors = true
vim.opt.showmode = false
vim.opt.showmatch = true
vim.opt.matchtime = 2

-- files
vim.opt.autoread = true
vim.opt.swapfile = false
vim.opt.undofile = true

-- Set undo directory and ensure it exists
local undodir = os.getenv 'HOME' .. '/.vim/undodir'
vim.opt.undodir = vim.fn.expand(undodir)
local undodir_path = vim.fn.expand(undodir)
if vim.fn.isdirectory(undodir_path) == 0 then
  vim.fn.mkdir(undodir_path, 'p')
end

vim.opt.mouse = 'a'
vim.opt.encoding = 'UTF-8'
vim.opt.wildmenu = true -- Enable command-line completion menu
vim.opt.wildmode = 'longest:full,full' -- Completion mode for command-line
vim.opt.wildignorecase = true -- Case-insensitive tab completion in commands

vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

vim.opt.breakindent = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.updatetime = 50
-- vim.opt.timeoutlen = 300

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.opt.inccommand = 'split'

vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 8
vim.opt.wrap = false
vim.opt.cmdheight = 1

-- tabs & indentation
vim.opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
vim.opt.shiftwidth = 2 -- 2 spaces for indent width
vim.opt.expandtab = true -- expand tab to spaces
vim.opt.autoindent = true -- copy indent from current line when starting new ones

-- backspace
vim.opt.backspace = 'indent,eol,start' -- allow backspace on indent, end of line or insert mode start position

-- Set the default border for all floating windows
vim.opt.winborder = 'rounded'

vim.opt.grepprg = 'rg --vimgrep' -- Use ripgrep if available
vim.opt.grepformat = '%f:%l:%c:%m' -- filename, line number, column, content
