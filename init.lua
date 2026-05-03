vim.pack.add {
	"https://github.com/nvim-treesitter/nvim-treesitter",
	"https://github.com/wakatime/vim-wakatime",
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/nvim-telescope/telescope.nvim",
	"https://github.com/kdheepak/lazygit.nvim",
	"https://github.com/neovim/nvim-lspconfig",
}

-- Load telescope as dependency for LazyGit --
require("telescope").setup()
require("telescope").load_extension("lazygit")

local builtin = require('telescope.builtin')

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
vim.keymap.set('n', '<leader>e', '<cmd>Ex<cr>', {})
vim.keymap.set('n', '<leader>v', '<cmd>vsplit<cr>', {})
vim.keymap.set('n', '<leader>V', '<cmd>Vexplore<cr>', {})
vim.keymap.set('n', '<leader>w', '<cmd>w<cr>', {})

-- Telescope --
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
	
-- LazyGit --
vim.keymap.set('n', '<leader>lg', '<cmd>LazyGit<cr>')

-- LSP --
vim.diagnostic.config({
  virtual_text = true,
  underline = true,
  update_in_insert = true,
  severity_sort = true,
})

vim.lsp.enable({
	-- Rust --
  "rust_analyzer",
	-- Go --
  "gopls",
	-- Ruby --
  "ruby_lsp",
	-- JSON --
  "jsonls",
	-- Typst --
  "tinymist",
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local map = function(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, {
        buffer = ev.buf,
        desc = desc,
      })
    end

    map("n", "gd", vim.lsp.buf.definition, "Go to definition")
    map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
    map("n", "gr", vim.lsp.buf.references, "References")
    map("n", "gi", vim.lsp.buf.implementation, "Implementation")
    map("n", "K", vim.lsp.buf.hover, "Hover")
    map("n", "<leader>rn", vim.lsp.buf.rename, "Rename")
    map("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")
    map("n", "<leader>f", function()
      vim.lsp.buf.format({ async = true })
    end, "Format")
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    pcall(vim.treesitter.start)
  end,
})

vim.cmd.colorscheme("habamax")
