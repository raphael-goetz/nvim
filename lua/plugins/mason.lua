vim.diagnostic.config({
	virtual_text = true,
	underline = true,
	update_in_insert = true,
})

-- Start each installed LSP automatically when opening a matching file
local function autostart_lsp(server, config)
	vim.api.nvim_create_autocmd("FileType", {
		pattern = "*",
		callback = function(ev)
			config.name = server
			vim.lsp.start(config)
		end,
	})
end

return {
	-- Mason: installs language servers
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},

	-- mason-lspconfig: connects Mason → Neovim LSP system
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "neovim/nvim-lspconfig" },
		opts = {
			ensure_installed = {
				"lua_ls",
				"rust_analyzer",
				"gopls",
				"jsonls"
			},
			handlers = {
				function(server)
					-- New Neovim 0.11 API
					local config = vim.lsp.config(server, {
						autostart = false,             -- we autostart manually
						settings = {},
					})

					autostart_lsp(server, config)
				end,
			},
		},
	},
}
