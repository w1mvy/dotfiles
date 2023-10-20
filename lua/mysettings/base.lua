-- encoding
vim.o.encoding = 'utf-8'
vim.scriptencoding = 'utf-8'

-- visual
vim.o.ambiwidth = 'double'
vim.o.textwidth = 0
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.smartindent = true
vim.cmd[[syntax on]]
vim.cmd[[colorscheme jellybeans]]

vim.o.visualbell = true
vim.o.number = true
vim.o.ruler = true
vim.o.showmatch = true
vim.o.matchtime = 1

vim.o.title = true
vim.o.folddmethod = 'marker'

-- search
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.wrapscan = true
vim.o.smartcase = true
vim.o.hlsearch = true
vim.o.wildignorecase = true

vim.api.nvim_set_keymap('n', '<Esc><Esc>', ':nohl<CR>', { noremap = true, silent = true})

-- manipulation
vim.g.mapleader = ' '
vim.opt.clipboard:append{'unnamedplus'}
vim.o.ttimeout = true
vim.o.ttimeoutlen = 50

vim.o.undofile = true
vim.o.undodir = vim.fn.stdpath('cache') .. '/undo'

vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true })
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true })
vim.api.nvim_set_keymap('n', '<Down>', 'gj', { noremap = true })
vim.api.nvim_set_keymap('n', '<Up>', 'gk', { noremap = true })
vim.api.nvim_set_keymap('n', 'gj', 'j', { noremap = true })
vim.api.nvim_set_keymap('n', 'gk', 'k', { noremap = true })


-- delete end of line space
vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  pattern = '*',
  command = [[:%s/\s\+$//ge]],
})

-- file settings
vim.api.nvim_create_autocmd({ 'FileType' }, {
  pattern = 'go',
  command = 'setl tabstop=8 shiftwidth=8 noet',
})
vim.api.nvim_create_autocmd({ 'FileType' }, {
  pattern = 'rego',
  command = 'setl tabstop=8 shiftwidth=8 noet',
})
