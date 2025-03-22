local keymap = vim.keymap -- for conciseness

keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
keymap.set('n', '<C-d>', '<C-d>zz')
keymap.set('n', '<C-u>', '<C-u>zz')

-- diagnostic
keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Disable arrow keys in normal mode
-- keymap.set('n', '<left>', '<cmd>echo "Use h to move!"<CR>')
-- keymap.set('n', '<right>', '<cmd>echo "Use l to move!"<CR>')
-- keymap.set('n', '<up>', '<cmd>echo "Use k to move!"<CR>')
-- keymap.set('n', '<down>', '<cmd>echo "Use j to move!"<CR>')

-- Keybinds to make split navigation easier.
-- Use CTRL+<hjkl> to switch between windows
keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- open vertical split
keymap.set('n', '<C-\\>', '<cmd>vsplit<CR>')

keymap.set('n', '<C-x>', '<Cmd>BufferClose<CR>', { noremap = true, silent = true })
