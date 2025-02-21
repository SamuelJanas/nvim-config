local map = vim.keymap.set
local builtin = require('telescope.builtin')
local nvim_tmux_nav = require('nvim-tmux-navigation')

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

map('v', '<leader>s*', 'c****<Esc>hPw')
map('n', '<leader>s*', 'ciw****<Esc>hPw')

-- tree
map('n', '<Leader>e', ':Neotree filesystem toggle right<CR>')

-- remove highlight after search
map('n', '<Esc>', ':noh<CR>')

-- move between panes
-- map('n', '<c-k>', ':wincmd k<CR>')
-- map('n', '<c-j>', ':wincmd j<CR>')
-- map('n', '<c-h>', ':wincmd h<CR>')
-- map('n', '<c-l>', ':wincmd l<CR>')

nvim_tmux_nav.setup {
disable_when_zoomed = true -- defaults to false
}

vim.keymap.set('n', "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
vim.keymap.set('n', "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
vim.keymap.set('n', "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
vim.keymap.set('n', "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
vim.keymap.set('n', "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
vim.keymap.set('n', "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)
