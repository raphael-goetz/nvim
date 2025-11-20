vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.relativenumber = true
vim.opt.winborder = "rounded"
vim.opt.undofile = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
vim.keymap.set('n', 'gr', vim.lsp.buf.references, {})

vim.keymap.set({ 'n' }, '<leader>ca', vim.lsp.buf.code_action, {})
vim.keymap.set({ 'n' }, '<leader>F', vim.lsp.buf.format, {})
vim.keymap.set('n', '<leader>q', ':Neotree filesystem reveal left toggle<CR>', {})
