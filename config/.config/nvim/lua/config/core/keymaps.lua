vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- scroll
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Next search result (centered)' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Previous search result (centered)' })
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!"<CR>')

-- Keybinds to make split navigation easier.
-- Use CTRL+<hjkl> to switch between windows
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- vertical splict

-- Splitting & Resizing
-- vim.keymap.set('n', '<leader>sv', '<Cmd>vsplit<CR>', { desc = 'Split window vertically' })
-- vim.keymap.set('n', '<leader>sh', '<Cmd>split<CR>', { desc = 'Split window horizontally' })
vim.keymap.set('n', '<C-v>', '<cmd>vsplit<CR>', { desc = 'Vertical split' })
vim.keymap.set('n', '<C-Up>', '<Cmd>resize +2<CR>', { desc = 'Increase window height' })
vim.keymap.set('n', '<C-Down>', '<Cmd>resize -2<CR>', { desc = 'Decrease window height' })
vim.keymap.set('n', '<C-Left>', '<Cmd>vertical resize -2<CR>', { desc = 'Decrease window width' })
vim.keymap.set('n', '<C-Right>', '<Cmd>vertical resize +2<CR>', { desc = 'Increase window width' })

-- Better indenting in visual mode
vim.keymap.set('v', '<', '<gv', { desc = 'Indent left and reselect' })
vim.keymap.set('v', '>', '>gv', { desc = 'Indent right and reselect' })

-- close buffer
vim.keymap.set('n', '<C-x>', '<cmd>bd<CR>', { desc = 'close current buffer' })

-- linting
vim.keymap.set('n', '<leader>es', '<cmd>LspEslintFixAll<cr>', { desc = 'fix eslint' })
