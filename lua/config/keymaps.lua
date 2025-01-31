local map = vim.keymap.set
local builtin = require('telescope.builtin')

vim.g.mapleader = " "

map('n', '<Leader>ff', builtin.find_files, {desc = 'Telescope find files'})
map('n', '<Leader>fg', builtin.live_grep, {desc = 'Telescope live grep'})

-- K for Krack
map("n", "K", 'i<CR><Esc>', { noremap = true })

--surrounding
map('n', '<Leader>s(', 'bcw()<Esc>P')
map('n', '<Leader>s)', 'bcw()<Esc>P')
map('n', '<Leader>s{', 'bcw{}<Esc>P')
map('n', '<Leader>s}', 'bcw{}<Esc>P')
map('n', '<Leader>s[', 'bcw[]<Esc>P')
map('n', '<Leader>s]', 'bcw[]<Esc>P')

map('v', '<Leader>s(', 'c()<Esc>P')
map('v', '<Leader>s)', 'c()<Esc>P')
map('v', '<Leader>s{', 'c{}<Esc>P')
map('v', '<Leader>s}', 'c{}<Esc>P')
map('v', '<Leader>s[', 'c[]<Esc>P')
map('v', '<Leader>s]', 'c[]<Esc>P')

-- tree
map('n', '<Leader>e', ':Neotree filesystem reveal right<CR>')
