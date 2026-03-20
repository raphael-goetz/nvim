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

local function float_term(cmd)
	local width = math.floor(vim.o.columns * 0.95)
	local height = math.floor(vim.o.lines * 0.95)
	local row = math.floor((vim.o.lines - height) / 2)
	local col = math.floor((vim.o.columns - width) / 2)

	local buf = vim.api.nvim_create_buf(false, true)
	vim.api.nvim_open_win(buf, true, {
		relative = "editor",
		width = width,
		height = height,
		row = row,
		col = col,
		style = "minimal",
		border = "rounded",
	})

	vim.fn.termopen(cmd, {
		on_exit = function()
			if vim.api.nvim_buf_is_valid(buf) then
				vim.api.nvim_buf_delete(buf, { force = true })
			end
		end,
	})

	vim.cmd("startinsert")
	vim.keymap.set("t", "<esc>", "<C-\\><C-n>:bd!<CR>", { buffer = buf, silent = true })
end

vim.keymap.set("n", "<leader>ls", function()
	float_term("lazysoundtui")
end, { desc = "LazySound TUI (float)" })
vim.keymap.set("n", "<leader>lp", function()
	vim.fn.jobstart({ "lazysoundctl", "pause" }, { detach = true })
end, { desc = "Pause/Resume" })

vim.keymap.set("n", "<leader>ln", function()
	vim.fn.jobstart({ "lazysoundctl", "next" }, { detach = true })
end, { desc = "Next Track" })

vim.keymap.set("n", "<leader>lP", function()
	vim.fn.jobstart({ "lazysoundctl", "prev" }, { detach = true })
end, { desc = "Prev Track" })
